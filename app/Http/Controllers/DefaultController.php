<?php

namespace App\Http\Controllers;

use App\Models\Gudang;
use App\Models\Product;
use Illuminate\Http\Request;

class DefaultController extends Controller
{
    // Get all products by category
    public function GetProducts(Request $request)
    {
        $category_id = $request->category_id;
        $gudang = Gudang::where('user_id', auth()->user()->id)->first();
        $allProducts = Product::with('supplier')->where('gudang_id', $gudang->id)->where('category_id', $category_id)->get();

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
