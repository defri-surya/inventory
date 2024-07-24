<?php

namespace App\Http\Controllers\StaffToko;

use App\Models\Agen;
use App\Models\Product;
use App\Models\Customer;
use App\Models\Supplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Gloudemans\Shoppingcart\Facades\Cart;
use App\Http\Controllers\Controller;
use App\Models\ListToko;
use App\Models\ProductToko;

class PosTokoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $row = (int) request('row', 10);

        if ($row < 1 || $row > 100) {
            abort(400, 'The per-page parameter must be an integer between 1 and 100.');
        }

        $tokoid = ListToko::where('user_id', auth()->user()->id)->first();
        $products = ProductToko::with(['category', 'unit'])
            ->where('toko_id', $tokoid->id)
            ->where('stock', '>', 0)
            ->filter(request(['search']))
            ->sortable()
            ->paginate($row)
            ->appends(request()->query());

        $customers = Customer::all()->sortBy('name');
        $sales = Agen::all()->sortBy('name');
        //        dd($sales);

        $carts = Cart::content();

        return view('StaffToko.pos.index', [
            'products' => $products,
            'customers' => $customers,
            'sales' => $sales,
            'carts' => $carts,
        ]);
    }

    /**
     * Handle add product to cart.
     */
    public function addCartItem(Request $request)
    {
        $rules = [
            'id' => 'required|numeric',
            'name' => 'required|string',
            'price' => 'required|numeric',
        ];

        $validatedData = $request->validate($rules);

        Cart::add([
            'id' => $validatedData['id'],
            'name' => $validatedData['name'],
            'qty' => 1,
            'price' => $validatedData['price']
        ]);

        return Redirect::back()->with('success', 'Product has been added to cart!');
    }

    /**
     * Handle update product in cart.
     */
    public function updateCartItem(Request $request, $rowId)
    {
        $rules = [
            'qty' => 'required|numeric',
        ];

        $validatedData = $request->validate($rules);

        Cart::update($rowId, $validatedData['qty']);

        return Redirect::back()->with('success', 'Product has been updated from cart!');
    }

    /**
     * Handle delete product from cart.
     */
    public function deleteCartItem(String $rowId)
    {
        Cart::remove($rowId);

        return Redirect::back()->with('success', 'Product has been deleted from cart!');
    }

    /**
     * Handle create an invoice.
     */
    public function createInvoice(Request $request)
    {
        $rules = [
            'customer_id' => 'required|string',
            'agen_id' => 'required|string'
        ];

        $validatedData = $request->validate($rules);
        // dd($validatedData);
        $customer = Customer::where('id', $validatedData['customer_id'])->first();
        $sales = Agen::where('id', $validatedData['agen_id'])->first();

        return redirect()->route('posToko.getInvoice', [
            'customer_id' => $customer->id,
            'agen_id' => $sales->id,
        ]);
    }

    public function getInvoice(Request $request)
    {
        $customer_id = $request->query('customer_id');
        $agen_id = $request->query('agen_id');
        $customer = Customer::where('id', $customer_id)->first();
        $sales = Customer::where('id', $agen_id)->first();
        $carts = Cart::content();
        $tokoid = ListToko::where('user_id', auth()->user()->id)->first();
        // dd($customer, $carts);

        return view('StaffToko.pos.struck', [
            'customer' => $customer,
            'carts' => $carts,
            'sales' => $sales,
            'tokoid' => $tokoid,
        ]);
    }
}
