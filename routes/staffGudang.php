<?php

use App\Http\Controllers\StaffGudang\OrderGudangController;
use App\Http\Controllers\StaffGudang\PosGudangController;
use App\Http\Controllers\StaffGudang\ProductGudangController;
use App\Http\Controllers\StaffGudang\PurchaseGudangController;
use App\Http\Controllers\StaffGudang\ReportGudangPurchaseController;
use App\Http\Controllers\StaffGudang\ReportGudangSalesController;
use App\Http\Controllers\StaffGudang\ReturnGudangPurchaseController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::middleware('auth')->group(function () {
    // Route Product
    Route::get('/products-gudang/export', [ProductGudangController::class, 'export'])->name('products-gudang.export');
    Route::get('/products-gudang/import', [ProductGudangController::class, 'import'])->name('products-gudang.import');
    Route::post('/products-gudang/import', [ProductGudangController::class, 'handleImport'])->name('products-gudang.handleImport');
    Route::resource('/products-gudang', ProductGudangController::class);
    Route::get('/products-gudang/{name}', [ProductGudangController::class, 'show'])->name('products-gudang.show');
    Route::put('change-status-product-gudang/{id}', [ProductGudangController::class, 'changeStatus'])->name('change-status-product-gudang');
    // End

    // Route Purchases
    Route::get('/purchases-gudang', [PurchaseGudangController::class, 'allPurchases'])->name('purchasesGudang.allPurchases');
    Route::get('/purchases-gudang/approved', [PurchaseGudangController::class, 'approvedPurchases'])->name('purchasesGudang.approvedPurchases');
    Route::get('/purchases-gudang/create', [PurchaseGudangController::class, 'createPurchase'])->name('purchasesGudang.createPurchase');
    Route::post('/purchases-gudang', [PurchaseGudangController::class, 'storePurchase'])->name('purchasesGudang.storePurchase');
    Route::put('/purchases-gudang/update', [PurchaseGudangController::class, 'updatePurchase'])->name('purchasesGudang.updatePurchase');
    Route::put('/purchases-gudang-paid/update', [PurchaseGudangController::class, 'updatePurchasePaid'])->name('purchasesGudang.updatePurchasePaid');
    Route::get('/purchases-gudang/details/{purchase_id}', [PurchaseGudangController::class, 'purchaseDetails'])->name('purchasesGudang.purchaseDetails');
    Route::delete('/purchases-gudang/delete/{purchase_id}', [PurchaseGudangController::class, 'deletePurchase'])->name('purchasesGudang.deletePurchase');
    //Return Purchases
    Route::get('/purchases-gudang/return/{purchase_id}', [PurchaseGudangController::class, 'returnPurchase'])->name('purchasesGudang.createReturn');
    Route::post('/purchases-gudang/return/create', [ReturnGudangPurchaseController::class, 'clonePurchaseToReturn'])->name('purchasesGudang.returnProduct');

    Route::get('/purchases-gudang/report', [PurchaseGudangController::class, 'dailyPurchaseReport'])->name('purchasesGudang.dailyPurchaseReport');
    Route::post('/purchases-gudang-daily/export', [PurchaseGudangController::class, 'dailyExportPurchaseReport'])->name('purchasesGudang.dailyExportPurchaseReport');
    Route::get('/purchases-gudang/jatuh-tempo', [PurchaseGudangController::class, 'dueDateReport'])->name('purchasesGudang.dueDate');
    Route::post('/purchases-gudang-due/export', [PurchaseGudangController::class, 'dueExportPurchaseReport'])->name('purchasesGudang.dueExportPurchaseReport');
    Route::get('/purchases-gudang-get/report/export', [PurchaseGudangController::class, 'getPurchaseReport'])->name('purchasesGudang.getPurchaseReport');
    Route::post('/purchases-gudang/report/export', [PurchaseGudangController::class, 'exportPurchaseReport'])->name('purchasesGudang.exportPurchaseReport');
    //    invoice
    Route::get('/invoice-bill-gudang/{purchase_id}', [PurchaseGudangController::class, 'invoiceBill'])->name('purchasesGudang.invoiceBill');
    Route::get('/invoice-bill-gudang/{purchase_id}/pdf', [PurchaseGudangController::class, 'invoiceBillPdf'])->name('purchasesGudang.invoiceBillPdf');
    //    PO Letter
    Route::get('/PO-gudang/{purchase_id}', [PurchaseGudangController::class, 'PO'])->name('purchasesGudang.PO');

    // Route Request Order
    Route::get('/request/order', [OrderGudangController::class, 'requestOrder'])->name('requestOrder.index');
    Route::get('/request-detail/order/{order_id}', [OrderGudangController::class, 'requestOrderDetails'])->name('requestOrder.details');
    Route::put('/request-process/order/{order_id}', [OrderGudangController::class, 'requestOrderProcess'])->name('requestOrderProcess');
    Route::get('/process/order/{order_id}', [OrderGudangController::class, 'processOrder'])->name('processOrder');
    Route::post('/process-order-gudang/invoice', [OrderGudangController::class, 'createInvoice'])->name('processOrder.createInvoice');
    Route::get('/process-order-gudang-detail/invoice', [OrderGudangController::class, 'getInvoice'])->name('processOrder.getInvoice');
    Route::post('/process-order-gudang/create', [OrderGudangController::class, 'createOrderProcess'])->name('processOrder.createOrder');
    // End

    // Route POS
    Route::get('/pos-gudang', [PosGudangController::class, 'index'])->name('posGudang.index');
    Route::post('/pos-gudang/cart/add', [PosGudangController::class, 'addCartItem'])->name('posGudang.addCartItem');
    Route::post('/pos-gudang/cart/update/{rowId}', [PosGudangController::class, 'updateCartItem'])->name('posGudang.updateCartItem');
    Route::delete('/pos-gudang/cart/delete/{rowId}', [PosGudangController::class, 'deleteCartItem'])->name('posGudang.deleteCartItem');
    Route::post('/pos-gudang/invoice', [PosGudangController::class, 'createInvoice'])->name('posGudang.createInvoice');
    Route::get('/pos-gudang-detail/invoice', [PosGudangController::class, 'getInvoice'])->name('posGudang.getInvoice');
    Route::post('/pos-gudang/create', [OrderGudangController::class, 'createOrder'])->name('posGudang.createOrder');
    //  End

    // Route Orders
    Route::get('/orders-gudang/pending', [OrderGudangController::class, 'pendingOrders'])->name('orderGudang.pendingOrders');
    Route::get('/orders-gudang/pending/{order_id}', [OrderGudangController::class, 'orderDetails'])->name('orderGudang.orderPendingDetails');
    Route::get('/orders-gudang/complete', [OrderGudangController::class, 'completeOrders'])->name('orderGudang.completeOrders');
    Route::get('/orders-gudang/complete/{order_id}', [OrderGudangController::class, 'orderDetails'])->name('orderGudang.orderCompleteDetails');
    Route::get('/orders-gudang/details/{order_id}/download', [OrderGudangController::class, 'downloadInvoice'])->name('orderGudang.downloadInvoice');
    Route::get('/orders-gudang/due', [OrderGudangController::class, 'dueOrders'])->name('orderGudang.dueOrders');
    Route::get('/orders-gudang/due/pay/{order_id}', [OrderGudangController::class, 'dueOrderDetails'])->name('orderGudang.dueOrderDetails');
    Route::put('/orders-gudang/due/pay/update', [OrderGudangController::class, 'updateDueOrder'])->name('orderGudang.updateDueOrder');
    Route::put('/orders-gudang/update', [OrderGudangController::class, 'updateOrder'])->name('orderGudang.updateOrder');
    // End

    // Order Surat Jalan
    Route::post('/orders-gudang/delivery-order/store', [OrderGudangController::class, 'storeDO'])->name('delivery-orderGudang.store');
    Route::get('/orders-gudang/delivery-order/create/{order_id}', [OrderGudangController::class, 'createDelivery'])->name('delivery-orderGudang.create');
    Route::get('/orders-gudang/delivery-order/{order_id}', [OrderGudangController::class, 'deliveryOrder'])->name('orderGudang.deliveryOrder');
    // End

    // Route Reports
    Route::get('/reports-gudang/purchase', [ReportGudangPurchaseController::class, 'allPurchases'])->name('reportsGudang.purchase');
    Route::get('/reports-gudang/sales', [ReportGudangSalesController::class, 'allSales'])->name('reportsGudang.sales');
    Route::get('/sales-gudang-get/report/export', [ReportGudangSalesController::class, 'getSalesReport'])->name('salesGudang.getSalesReport');
    Route::post('/sales-gudang/export', [ReportGudangSalesController::class, 'ExportSalesReport'])->name('salesGudang.ExportSalesReport');
    // End

    // Route Stock
    Route::get('/stock-toko', [ProductGudangController::class, 'stockToko'])->name('stockToko.index');
    Route::get('/stock-toko/detail/{id}', [ProductGudangController::class, 'stockTokoDetail'])->name('stockToko.show');
    // End
});
