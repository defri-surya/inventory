<?php

namespace App\Http\Controllers;

use App\Models\ListToko;
use App\Models\ProductToko;
use Illuminate\Http\Request;

class DefaultTokoController extends Controller
{
    // Get all products by category
    public function GetProductsToko(Request $request)
    {
        $category_id = $request->category_id;
        $tokoid = ListToko::where('user_id', auth()->user()->id)->first();
        $allProducts = ProductToko::with('supplier')->where('toko_id', $tokoid->id)->where('category_id', $category_id)->get();

        $productData = [];

        foreach ($allProducts as $product) {
            $productData[] = [
                'id' => $product->id,
                'product_name' => $product->product_name,
                'buying_price' => $product->buying_price,
                'supplier_name' => $product->supplier->name,
            ];
        }

        return response()->json($productData);
    }
}
