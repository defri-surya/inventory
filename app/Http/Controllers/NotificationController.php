<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Purchase;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Cache;
use App\Http\Controllers\Controller;

class NotificationController extends Controller
{
    public function lowProductNotif(Request $request)
    {
        // Menentukan durasi cache dalam menit (misalnya 10 menit)
        $cacheDuration = 10;

        // Mengambil hasil dari cache atau menjalankan query jika cache tidak tersedia
        $notifications = Cache::remember('low_product_notif', $cacheDuration * 60, function () {
            // Fetch products where stock is less than or equal to the min_stock
            $lowStockProducts = Product::where('stock', ' <= ', 'min_stock')->get();

            // Fetch purchases with due dates earlier than the current date and time
            $dueDatePurchase = Purchase::where('purchase_due_date', '!=', null)
                ->where('purchase_due_date', '<', Carbon::now())->get();

            // Combine low stock products and due date purchases into a single array
            return array_merge($lowStockProducts->toArray(), $dueDatePurchase->toArray());
        });

        return response()->json(['notifications' => $notifications]);
    }
}
