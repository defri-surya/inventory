<?php

namespace App\Http\Controllers\StaffToko;

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
use App\Models\ListToko;
use App\Models\ProductToko;

class OrderTokoController extends Controller
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

        $tokoid = ListToko::where('user_id', auth()->user()->id)->first();
        $orders = Order::where('order_status', 'pending')->filter(request(['search']))
            ->where('toko_id', $tokoid->id)
            ->sortable()
            ->paginate($row)
            ->appends(request()->query());

        return view('StaffToko.orders.pending-orders', [
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

        $tokoid = ListToko::where('user_id', auth()->user()->id)->first();
        $orders = Order::where('order_status', 'complete')->filter(request(['search']))
            ->where('toko_id', $tokoid->id)
            ->sortable()
            ->paginate($row)
            ->appends(request()->query());

        return view('StaffToko.orders.complete-orders', [
            'orders' => $orders
        ]);
    }

    public function dueOrders()
    {
        $row = (int) request('row', 10);

        if ($row < 1 || $row > 100) {
            abort(400, 'The per-page parameter must be an integer between 1 and 100.');
        }

        $tokoid = ListToko::where('user_id', auth()->user()->id)->first();
        $orders = Order::where('due', '>', '0')->filter(request(['search']))
            ->where('toko_id', $tokoid->id)
            ->sortable()
            ->paginate($row)
            ->appends(request()->query());

        return view('StaffToko.orders.due-orders', [
            'orders' => $orders
        ]);
    }

    /**
     * Display an order details.
     */
    public function dueOrderDetails(String $order_id)
    {
        $order = Order::where('id', $order_id)->first();
        $tokoid = ListToko::where('user_id', auth()->user()->id)->first();

        $orderDetails = OrderDetails::with('productToko')
            ->where('toko_id', $tokoid->id)
            ->where('order_id', $order_id)
            ->orderBy('id')
            ->get();
        // dd($orderDetails);

        return view('StaffToko.orders.details-due-order', [
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
        $orderDetails = OrderDetails::with('productToko')
            ->where('order_id', $order_id)
            ->orderBy('id')
            ->get();
        $deliveryOrder = DeliveryOrder::select('id_order')->where('id_order', $order_id)->first();
        // dd($deliveryOrder);

        return view('StaffToko.orders.details-order', [
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
        $tokoid = ListToko::where('user_id', auth()->user()->id)->first();

        $validatedData['order_date'] = Carbon::now()->format('Y-m-d');
        $validatedData['order_status'] = 'pending';
        $validatedData['bagian'] = 'Toko';
        $validatedData['toko_id'] = $tokoid->id;
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
            $oDetails['toko_id'] = $tokoid->id;
            $oDetails['created_at'] = Carbon::now();

            OrderDetails::insert($oDetails);
        }

        // Delete Cart Sopping History
        Cart::destroy();

        return Redirect::route('orderToko.pendingOrders')->with('success', 'Order has been created!');
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
            ProductToko::where('id', $product->product_id)
                ->update(['stock' => DB::raw('stock-' . $product->quantity)]);
        }

        Order::findOrFail($order_id)->update(['order_status' => 'complete']);

        return Redirect::route('orderToko.completeOrders')->with('success', 'Order has been completed!');
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

        return Redirect::route('orderToko.dueOrders')->with('success', 'Due amount has been updated!');
    }

    /**
     * Handle to print an invoice.
     */
    public function downloadInvoice(Int $order_id)
    {
        $order = Order::with('customer')->where('id', $order_id)->first();
        $orderDetails = OrderDetails::with('productToko')
            ->where('order_id', $order_id)
            ->orderBy('id', 'DESC')
            ->get();

        return view('StaffToko.orders.print-invoice', [
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
        return redirect()->route('orderToko.orderPendingDetails', $deliveryOrder->id_order)->with('success', 'Delivery order created successfully');
    }

    public function createDelivery(String $order_id)
    {
        $order = Order::where('id', $order_id)->first();

        return view('StaffToko.orders.delivery-create', [
            'order' => $order,
        ]);
    }


    public function deliveryOrder(Int $order_id)
    {
        $order = DeliveryOrder::with('order.customer')->where('id_order', $order_id)->first();
        $orderDetails = OrderDetails::with('productToko')
            ->where('order_id', $order_id)
            ->orderBy('id', 'DESC')
            ->get();

        return view('StaffToko.orders.delivery-order', [
            'order' => $order,
            'orderDetails' => $orderDetails,
        ]);
    }
}
