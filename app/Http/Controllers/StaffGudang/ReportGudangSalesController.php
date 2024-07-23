<?php

namespace App\Http\Controllers\StaffGudang;

use App\Http\Controllers\Controller;
use App\Models\Gudang;
use App\Models\Order;
use Illuminate\Support\Facades\DB;
use PhpOffice\PhpSpreadsheet\Writer\Xls;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use Exception;
use Illuminate\Http\Request;

class ReportGudangSalesController extends Controller
{
    public function allSales()
    {
        $row = (int) request('row', 10);

        if ($row < 1 || $row > 100) {
            abort(400, 'The per-page parameter must be an integer between 1 and 100.');
        }

        $gudang = Gudang::where('user_id', auth()->user()->id)->first();
        $orders = Order::filter(request(['search']))
            ->where('gudang_id', $gudang->id)
            ->sortable()
            ->paginate($row)
            ->appends(request()->query());

        return view('StaffGudang.salesreport.sales', [
            'orders' => $orders
        ]);
    }

    public function getSalesReport()
    {
        return view('StaffGudang.salesreport.report-sales');
    }

    public function ExportSalesReport(Request $request)
    {
        $rules = [
            'start_date' => 'required|string|date_format:Y-m-d',
            'end_date' => 'required|string|date_format:Y-m-d',
        ];

        $validatedData = $request->validate($rules);

        $sDate = $validatedData['start_date'];
        $eDate = $validatedData['end_date'];
        // dd($sDate, $eDate);

        // $purchaseDetails = DB::table('purchases')
        //     ->whereBetween('purchases.purchase_date',[$sDate,$eDate])
        //     ->where('purchases.purchase_status','1')
        //     ->join('purchase_details', 'purchases.id', '=', 'purchase_details.purchase_id')
        //     ->get();

        $reportSales = DB::table('orders')
            ->join('agens', 'orders.agen_id', '=', 'agens.id')
            ->join('customers', 'orders.customer_id', '=', 'customers.id')
            ->whereBetween('orders.order_date', [$sDate, $eDate])
            ->where('bagian', 'Gudang') // Additional condition for approved purchases
            ->select('agens.agen_name', 'customers.name', 'orders.order_date', 'orders.total_products', 'orders.total', 'orders.invoice_no', 'orders.payment_type', 'orders.pay', 'orders.due')
            ->get();
        // dd($reportSales);


        $sales_array[] = array(
            'Date',
            'Agen',
            'Customer',
            'Invoice',
            'Total Product',
            'Total',
            'Payment Type',
            'Terbayar',
            'Kurang',
        );

        foreach ($reportSales as $sale) {
            $sales_array[] = array(
                'Date' => $sale->order_date,
                'Agen' => $sale->agen_name,
                'Customer' => $sale->name,
                'Invoice' => $sale->invoice_no,
                'Total Product' => $sale->total_products,
                'Total' => $sale->total,
                'Payment Type' => $sale->payment_type,
                'Terbayar' => $sale->pay,
                'Kurang' => $sale->due,
            );
        }
        // dd($sales_array);

        $this->exportExcelSales($sales_array);
    }

    /**
     *This function loads the customer data from the database then converts it
     * into an Array that will be exported to Excel
     */
    public function exportExcelSales($products)
    {
        ini_set('max_execution_time', 0);
        ini_set('memory_limit', '4000M');

        try {
            $spreadSheet = new Spreadsheet();
            $spreadSheet->getActiveSheet()->getDefaultColumnDimension()->setWidth(20);
            $spreadSheet->getActiveSheet()->fromArray($products);
            $Excel_writer = new Xls($spreadSheet);
            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment;filename="sales-report.xls"');
            header('Cache-Control: max-age=0');
            ob_end_clean();
            $Excel_writer->save('php://output');
            exit();
        } catch (Exception $e) {
            return;
        }
    }
}
