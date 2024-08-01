<?php

namespace App\Http\Controllers\StaffGudang;

use App\Models\DeliveryOrder;
use Carbon\Carbon;
use App\Models\Order;
use App\Models\Product;
use App\Models\OrderDetails;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Gloudemans\Shoppingcart\Facades\Cart;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use App\Http\Controllers\Controller;
use App\Models\Agen;
use App\Models\Gudang;
use App\Models\ListToko;
use App\Models\Purchase;
use App\Models\PurchaseDetails;

class OrderGudangController extends Controller
{
    /**
     * Display a pending orders.
     */
    public function pendingOrders()
    {
        $row = (int) request('row', 10);

        if ($row < 1 || $row > 100) {
            abort(400, 'The per-page parameter must be an integer between 1 and 100.');
        }

        $gudangid = Gudang::where('user_id', auth()->user()->id)->first();
        $orders = Order::with('toko')->where('order_status', 'pending')->filter(request(['search']))
            ->where('gudang_id', $gudangid->id)
            ->sortable()
            ->paginate($row)
            ->appends(request()->query());

        return view('StaffGudang.orders.pending-orders', [
            'orders' => $orders
        ]);
    }

    /**
     * Display a pending orders.
     */
    public function completeOrders()
    {
        $row = (int) request('row', 10);

        if ($row < 1 || $row > 100) {
            abort(400, 'The per-page parameter must be an integer between 1 and 100.');
        }

        $gudangid = Gudang::where('user_id', auth()->user()->id)->first();
        $orders = Order::with('toko')->where('order_status', 'complete')->filter(request(['search']))
            ->where('gudang_id', $gudangid->id)
            ->sortable()
            ->paginate($row)
            ->appends(request()->query());

        return view('StaffGudang.orders.complete-orders', [
            'orders' => $orders
        ]);
    }

    public function dueOrders()
    {
        $row = (int) request('row', 10);

        if ($row < 1 || $row > 100) {
            abort(400, 'The per-page parameter must be an integer between 1 and 100.');
        }

        $gudangid = Gudang::where('user_id', auth()->user()->id)->first();
        $orders = Order::where('due', '>', '0')->filter(request(['search']))
            ->where('gudang_id', $gudangid->id)
            ->sortable()
            ->paginate($row)
            ->appends(request()->query());

        return view('StaffGudang.orders.due-orders', [
            'orders' => $orders
        ]);
    }

    /**
     * Display an order details.
     */
    public function dueOrderDetails(String $order_id)
    {
        $order = Order::where('id', $order_id)->first();
        $gudangid = Gudang::where('user_id', auth()->user()->id)->first();

        $orderDetails = OrderDetails::with('product')
            ->where('gudang_id', $gudangid->id)
            ->where('order_id', $order_id)
            ->orderBy('id')
            ->get();
        // dd($orderDetails);

        return view('StaffGudang.orders.details-due-order', [
            'order' => $order,
            'orderDetails' => $orderDetails,
        ]);
    }

    /**
     * Display an order details.
     */
    public function orderDetails(String $order_id)
    {
        $order = Order::where('id', $order_id)->first();
        $orderDetails = OrderDetails::with('product')
            ->where('order_id', $order_id)
            ->orderBy('id')
            ->get();

        $deliveryOrder = DeliveryOrder::select('id_order')->where('id_order', $order_id)->first();
        // dd($deliveryOrder);

        return view('StaffGudang.orders.details-order', [
            'deliveryOrder' => $deliveryOrder,
            'order' => $order,
            'orderDetails' => $orderDetails,
        ]);
    }

    /**
     * Handle create new order
     */
    public function createOrder(Request $request)
    {
        $rules = [
            'customer_id' => 'required|numeric',
            'payment_type' => 'required|string',
            'pay' => 'required|numeric',
            'agen_id' => 'required|numeric',
        ];

        $invoice_no = IdGenerator::generate([
            'table' => 'orders',
            'field' => 'invoice_no',
            'length' => 10,
            'prefix' => 'INV-'
        ]);

        $validatedData = $request->validate($rules);

        $validatedData['order_date'] = Carbon::now()->format('Y-m-d');
        $validatedData['order_status'] = 'pending';
        $validatedData['bagian'] = 'Gudang';
        $validatedData['total_products'] = Cart::count();
        //        $validatedData['fee'] = Cart::count() * $validatedData['fee'];
        $validatedData['sub_total'] = str_replace(',', '', Cart::subtotal());
        $validatedData['vat'] = str_replace(',', '', Cart::tax());
        $validatedData['invoice_no'] = $invoice_no;
        $validatedData['total'] = str_replace(',', '', Cart::total());
        $validatedData['due'] = ((int)str_replace(',', '', Cart::total()) - (int)$validatedData['pay']);
        $validatedData['created_at'] = Carbon::now();
        // dd($validatedData);

        $order_id = Order::insertGetId($validatedData);

        // Create Order Details
        $contents = Cart::content();
        $oDetails = array();

        foreach ($contents as $content) {
            $oDetails['order_id'] = $order_id;
            $oDetails['product_id'] = $content->id;
            $oDetails['quantity'] = $content->qty;
            $oDetails['unitcost'] = $content->price;
            $oDetails['total'] = $content->subtotal;
            $oDetails['bagian'] = 'Toko';
            $oDetails['created_at'] = Carbon::now();

            OrderDetails::insert($oDetails);
        }

        // Delete Cart Sopping History
        Cart::destroy();

        return Redirect::route('orderGudang.pendingOrders')->with('success', 'Order has been created!');
    }

    /**
     * Handle update a status order
     */
    public function updateOrder(Request $request)
    {
        $order_id = $request->id;

        // Reduce the stock
        $products = OrderDetails::where('order_id', $order_id)->get();

        foreach ($products as $product) {
            Product::where('id', $product->product_id)
                ->update(['stock' => DB::raw('stock-' . $product->quantity)]);
        }

        Order::findOrFail($order_id)->update(['order_status' => 'complete']);

        return Redirect::route('orderGudang.completeOrders')->with('success', 'Order has been completed!');
    }

    /**
     * Handle update a due pay order
     */
    public function updateDueOrder(Request $request)
    {
        $rules = [
            'id' => 'required|numeric',
            'pay' => 'required|numeric'
        ];

        $validatedData = $request->validate($rules);
        $order = Order::findOrFail($validatedData['id']);

        $mainPay = $order->pay;
        $mainDue = $order->due;

        $paidDue = $mainDue - $validatedData['pay'];
        $paidPay = $mainPay + $validatedData['pay'];

        Order::findOrFail($validatedData['id'])->update([
            'due' => $paidDue,
            'pay' => $paidPay
        ]);

        return Redirect::route('orderGudang.dueOrders')->with('success', 'Due amount has been updated!');
    }

    /**
     * Handle to print an invoice.
     */
    public function downloadInvoice(Int $order_id)
    {
        $order = Order::with('customer')->where('id', $order_id)->first();
        $orderDetails = OrderDetails::with('product')
            ->where('bagian', 'Gudang')
            ->where('order_id', $order_id)
            ->orderBy('id', 'DESC')
            ->get();

        return view('StaffGudang.orders.print-invoice', [
            'order' => $order,
            // 'delivery' => $deliveryOrder,
            'orderDetails' => $orderDetails,
        ]);
    }

    //    Delivery Order
    public function storeDO(Request $request)
    {
        // Validate the form data
        $validatedData = $request->validate([
            'id_customer' => 'required|integer',
            'id_order' => 'required|integer',
            'invoice_description' => 'required|string',
            'ship_via' => 'required|string',
            'delivery_date' => 'required|date',
        ]);

        $updateStatusPurchase = Purchase::where('supplier_id', $validatedData['id_customer'])->get();
        // dd($updateStatusPurchase);

        foreach ($updateStatusPurchase as $content) {
            $content->purchase_status = 4;
            $content->save();
        }

        // Generate a unique delivery_number (DLV-000 format)
        $deliveryOrderNumber = 'DLV-' . str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);

        // Create a new DeliveryOrder instance with the generated delivery_number
        $deliveryOrder = new DeliveryOrder([
            'delivery_number' => $deliveryOrderNumber,
            'id_customer' => $validatedData['id_customer'],
            'id_order' => $validatedData['id_order'],
            'invoice_description' => $validatedData['invoice_description'],
            'ship_via' => $validatedData['ship_via'],
            'delivery_date' => $validatedData['delivery_date'],
        ]);

        // Save the data to the database
        $deliveryOrder->save();


        // You can return a response if needed
        // return response()->json(['message' => 'Delivery order created successfully']);
        return redirect()->route('orderGudang.orderPendingDetails', $deliveryOrder->id_order)->with('success', 'Delivery order created successfully');
    }

    public function createDelivery(String $order_id)
    {
        $order = Order::where('id', $order_id)->first();

        return view('StaffGudang.orders.delivery-create', [
            'order' => $order,
        ]);
    }

    public function deliveryOrder(Int $order_id)
    {
        $order = DeliveryOrder::with('order.listtoko')->where('id_order', $order_id)->first();
        $profil = Gudang::where('user_id', auth()->user()->id)->first();
        $orderDetails = OrderDetails::with('product')
            ->where('order_id', $order_id)
            ->orderBy('id', 'DESC')
            ->get();

        return view('StaffGudang.orders.delivery-order', [
            'order' => $order,
            'orderDetails' => $orderDetails,
            'profil' => $profil,
        ]);
    }

    // Request Order
    public function requestOrder()
    {
        $row = (int) request('row', 10);

        if ($row < 1 || $row > 100) {
            abort(400, 'The per-page parameter must be an integer between 1 and 100.');
        }

        $gudang = Gudang::where('user_id', auth()->user()->id)->first();

        $orders = Purchase::with('supplier', 'toko')->filter(request(['search']))
            ->where('gudang_id', $gudang->id)
            ->where('purchase_status', '0')
            ->sortable()
            ->paginate($row)
            ->appends(request()->query());

        return view('StaffGudang.orders.requestorder.requestorder', [
            'orders' => $orders
        ]);
    }

    public function requestOrderDetails(String $order_id)
    {
        $orders = Purchase::with('toko')->where('id', $order_id)->first();
        $orderDetails = PurchaseDetails::with('product')
            ->where('purchase_id', $order_id)
            ->orderBy('id', 'DESC')
            ->get();
        // dd($orderDetails);

        return view('StaffGudang.orders.requestorder.details-request', [
            'orders' => $orders,
            'orderDetails' => $orderDetails,
        ]);
    }

    public function requestOrderProcess(Request $request, String $order_id)
    {
        $order = Purchase::with('toko')->where('id', $order_id)->first();
        // dd($order);

        $order->update([
            'purchase_status' => 3,
        ]);

        return redirect()->route('processOrder', $order_id);
    }

    public function processOrder(String $order_id)
    {
        $orders = Purchase::with('supplier')->where('id', $order_id)->first();
        $toko = ListToko::where('id', $orders->toko_id)->first();
        $orderDetails = PurchaseDetails::with('product')
            ->where('purchase_id', $order_id)
            ->get();
        $count = PurchaseDetails::where('purchase_id', $order_id)->count();
        $countUnitcost = PurchaseDetails::with('product')
            ->where('purchase_id', $order_id)
            ->sum('total');
        $ppnCount = $countUnitcost * 12 / 100;
        $ppnResult = $ppnCount + $countUnitcost;
        // dd($order->total_amount_paid);
        $sales = Agen::all()->sortBy('name');

        return view('StaffGudang.orders.requestorder.processorder', [
            'toko' => $toko,
            'orderDetails' => $orderDetails,
            'sales' => $sales,
            'count' => $count,
            'ppnCount' => $ppnCount,
            'ppnResult' => $ppnResult,
            'order_id' => $order_id,
            'orders' => $orders,
        ]);
    }

    public function createInvoice(Request $request)
    {
        $rules = [
            'order_id' => 'required|string',
            'customer_id' => 'required|string',
            'agen_id' => 'required|string',
            'tax' => 'required|string',
            'subtotal' => 'required|string',
            'total_product' => 'required|string'
        ];

        $validatedData = $request->validate($rules);
        // dd($validatedData);
        $customer = ListToko::where('id', $validatedData['customer_id'])->first();
        $sales = Agen::where('id', $validatedData['agen_id'])->first();
        $tax = $validatedData['tax'];
        $subtotal = $validatedData['subtotal'];
        $order_id = $validatedData['order_id'];
        $total_product = $validatedData['total_product'];

        return redirect()->route('processOrder.getInvoice', [
            'customer_id' => $customer->id,
            'agen_id' => $sales->id,
            'tax' => $tax,
            'subtotal' => $subtotal,
            'order_id' => $order_id,
            'total_product' => $total_product
        ]);
    }

    public function getInvoice(Request $request)
    {
        $customer_id = $request->query('customer_id');
        $agen_id = $request->query('agen_id');
        $tax = $request->query('tax');
        $subtotal = $request->query('subtotal');
        $order_id = $request->query('order_id');
        $total_product = $request->query('total_product');

        // dd($order_id);
        $orders = Purchase::with('supplier')->where('id', $order_id)->first();
        $customer = ListToko::where('id', $orders->toko_id)->first();
        $sales = ListToko::where('id', $agen_id)->first();

        $orderDetails = PurchaseDetails::with('product')
            ->where('purchase_id', $order_id)
            ->get();
        $count = PurchaseDetails::where('purchase_id', $order_id)->count();
        $countUnitcost = PurchaseDetails::with('product')
            ->where('purchase_id', $order_id)
            ->sum('total');
        $ppnCount = $countUnitcost * 12 / 100;
        $ppnResult = $countUnitcost + $ppnCount;
        // dd($customer_id, $agen_id, $tax, $subtotal, $order_id, $customer);

        return view('StaffGudang.orders.requestorder.processOrderCreate', [
            'customer' => $customer,
            'sales' => $sales,
            'orderDetails' => $orderDetails,
            'count' => $count,
            'countUnitcost' => $countUnitcost,
            'ppnCount' => $ppnCount,
            'ppnResult' => $ppnResult,
            'order_id' => $order_id,
        ]);
    }

    public function createOrderProcess(Request $request)
    {
        $rules = [
            'customer_id' => 'required|numeric',
            'payment_type' => 'required|string',
            'pay' => 'required|numeric',
            'agen_id' => 'required|numeric',
            'total_products' => 'required|numeric',
            'sub_total' => 'required|numeric',
            'vat' => 'required|numeric',
            'total' => 'required|numeric',
        ];

        $invoice_no = IdGenerator::generate([
            'table' => 'orders',
            'field' => 'invoice_no',
            'length' => 10,
            'prefix' => 'INV-'
        ]);

        $validatedData = $request->validate($rules);
        $gudang = Gudang::where('user_id', auth()->user()->id)->first();

        $validatedData['order_date'] = Carbon::now()->format('Y-m-d');
        $validatedData['order_status'] = 'pending';
        $validatedData['bagian'] = 'Gudang';
        $validatedData['gudang_id'] = $gudang->id;
        $validatedData['total_products'] = $validatedData['total_products'];
        //        $validatedData['fee'] = Cart::count() * $validatedData['fee'];
        $validatedData['sub_total'] = $validatedData['sub_total'];
        $validatedData['vat'] = $validatedData['vat'];
        $validatedData['invoice_no'] = $invoice_no;
        $validatedData['total'] = $validatedData['total'];
        $validatedData['due'] = ((int)$validatedData['total'] - (int)$validatedData['pay']);
        $validatedData['created_at'] = Carbon::now();
        // dd($validatedData);

        $order_id = Order::insertGetId($validatedData);

        // Create Order Details
        $contents = PurchaseDetails::with('product')
            ->where('purchase_id', $request->order_id)
            ->get();
        // dd($contents);
        $oDetails = [];

        foreach ($contents as $content) {
            $oDetails[] = [
                'order_id' => $order_id,
                'product_id' => $content->product_id,
                'quantity' => $content->quantity,
                'unitcost' => $content->unitcost,
                'total' => $content->total,
                'bagian' => 'Gudang',
                'gudang_id' => $gudang->id,
                'created_at' => Carbon::now(),
            ];
        }
        // dd($oDetails);
        OrderDetails::insert($oDetails);

        return Redirect::route('orderGudang.pendingOrders')->with('success', 'Order has been created!');
    }
}
