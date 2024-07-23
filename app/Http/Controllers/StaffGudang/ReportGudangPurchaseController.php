<?php

namespace App\Http\Controllers\StaffGudang;

use App\Http\Controllers\Controller;
use App\Models\Gudang;
use App\Models\Purchase;
use Illuminate\Http\Request;

class ReportGudangPurchaseController extends Controller
{
    public function allPurchases()
    {
        $row = (int)request('row', 10);

        if ($row < 1 || $row > 100) {
            abort(400, 'The per-page parameter must be an integer between 1 and 100.');
        }

        $gudang = Gudang::where('user_id', auth()->user()->id)->first();
        $purchases = Purchase::with(['supplier'])->filter(request(['search']))
            ->where('gudang_id', $gudang->id)
            ->sortable()
            ->paginate($row)
            ->appends(request()->query());

        return view('StaffGudang.reportpurchase.purchases', [
            'purchases' => $purchases
        ]);
    }
}
