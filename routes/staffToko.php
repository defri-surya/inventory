<?php

use App\Http\Controllers\StaffToko\DefaultTokoController;
use App\Http\Controllers\StaffToko\OrderTokoController;
use App\Http\Controllers\StaffToko\PosTokoController;
use App\Http\Controllers\StaffToko\ProductTokoController;
use App\Http\Controllers\StaffToko\PurchaseTokoController;
use App\Http\Controllers\StaffToko\ReportSalesTokoController;
use App\Http\Controllers\StaffToko\ReturnPurchaseTokoController;
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
    Route::get('/products-toko/export', [ProductTokoController::class, 'export'])->name('products-toko.export');
    Route::get('/products-toko/import', [ProductTokoController::class, 'import'])->name('products-toko.import');
    Route::post('/products-toko/import', [ProductTokoController::class, 'handleImport'])->name('products-toko.handleImport');
    Route::resource('/products-toko', ProductTokoController::class);
    Route::get('/products-toko/{name}', [ProductTokoController::class, 'show'])->name('products-toko.show');
    Route::put('change-status-product-toko/{id}', [ProductTokoController::class, 'changeStatus'])->name('change-status-product-toko');
    // End

    // Route Purchases
    Route::get('/purchases-toko', [PurchaseTokoController::class, 'allPurchases'])->name('purchasesToko.allPurchases');
    Route::get('/purchases-toko/approved', [PurchaseTokoController::class, 'approvedPurchases'])->name('purchasesToko.approvedPurchases');
    Route::get('/purchases-toko/create', [PurchaseTokoController::class, 'createPurchase'])->name('purchasesToko.createPurchase');
    Route::post('/purchases-toko', [PurchaseTokoController::class, 'storePurchase'])->name('purchasesToko.storePurchase');
    Route::put('/purchases-toko/update', [PurchaseTokoController::class, 'updatePurchase'])->name('purchasesToko.updatePurchase');
    Route::put('/purchases-toko-paid/update', [PurchaseTokoController::class, 'updatePurchasePaid'])->name('purchasesToko.updatePurchasePaid');
    Route::get('/purchases-toko/details/{purchase_id}', [PurchaseTokoController::class, 'purchaseDetails'])->name('purchasesToko.purchaseDetails');
    Route::delete('/purchases-toko/delete/{purchase_id}', [PurchaseTokoController::class, 'deletePurchase'])->name('purchasesToko.deletePurchase');
    //Return Purchases
    Route::get('/purchases-toko/return/{purchase_id}', [PurchaseTokoController::class, 'returnPurchase'])->name('purchasesToko.createReturn');
    Route::post('/purchases-toko/return/create', [ReturnPurchaseTokoController::class, 'clonePurchaseToReturn'])->name('purchasesToko.returnProduct');

    Route::get('/purchases-toko/report', [PurchaseTokoController::class, 'dailyPurchaseReport'])->name('purchasesToko.dailyPurchaseReport');
    Route::post('/purchases-toko-daily/export', [PurchaseTokoController::class, 'dailyExportPurchaseReport'])->name('purchasesToko.dailyExportPurchaseReport');
    Route::get('/purchases-toko/jatuh-tempo', [PurchaseTokoController::class, 'dueDateReport'])->name('purchasesToko.dueDate');
    Route::post('/purchases-toko-due/export', [PurchaseTokoController::class, 'dueExportPurchaseReport'])->name('purchasesToko.dueExportPurchaseReport');
    Route::get('/purchases-toko-get/report/export', [PurchaseTokoController::class, 'getPurchaseReport'])->name('purchasesToko.getPurchaseReport');
    Route::post('/purchases-toko/report/export', [PurchaseTokoController::class, 'exportPurchaseReport'])->name('purchasesToko.exportPurchaseReport');
    //    invoice
    Route::get('/invoice-bill-toko/{purchase_id}', [PurchaseTokoController::class, 'invoiceBill'])->name('purchasesToko.invoiceBill');
    Route::get('/invoice-bill-toko/{purchase_id}/pdf', [PurchaseTokoController::class, 'invoiceBillPdf'])->name('purchasesToko.invoiceBillPdf');
    //    PO Letter
    Route::get('/PO-toko/{purchase_id}', [PurchaseTokoController::class, 'PO'])->name('purchasesToko.PO');

    // Route POS
    Route::get('/pos-toko', [PosTokoController::class, 'index'])->name('posToko.index');
    Route::post('/pos-toko/cart/add', [PosTokoController::class, 'addCartItem'])->name('posToko.addCartItem');
    Route::post('/pos-toko/cart/update/{rowId}', [PosTokoController::class, 'updateCartItem'])->name('posToko.updateCartItem');
    Route::delete('/pos-toko/cart/delete/{rowId}', [PosTokoController::class, 'deleteCartItem'])->name('posToko.deleteCartItem');
    Route::post('/pos-toko/invoice', [PosTokoController::class, 'createInvoice'])->name('posToko.createInvoice');
    Route::get('/pos-toko-detail/invoice', [PosTokoController::class, 'getInvoice'])->name('posToko.getInvoice');
    Route::post('/pos-toko/create', [OrderTokoController::class, 'createOrder'])->name('posToko.createOrder');
    //  End

    // Route Orders
    Route::get('/orders-toko/pending', [OrderTokoController::class, 'pendingOrders'])->name('orderToko.pendingOrders');
    Route::get('/orders-toko/pending/{order_id}', [OrderTokoController::class, 'orderDetails'])->name('orderToko.orderPendingDetails');
    Route::get('/orders-toko/complete', [OrderTokoController::class, 'completeOrders'])->name('orderToko.completeOrders');
    Route::get('/orders-toko/complete/{order_id}', [OrderTokoController::class, 'orderDetails'])->name('orderToko.orderCompleteDetails');
    Route::get('/orders-toko/details/{order_id}/download', [OrderTokoController::class, 'downloadInvoice'])->name('orderToko.downloadInvoice');
    Route::get('/orders-toko/due', [OrderTokoController::class, 'dueOrders'])->name('orderToko.dueOrders');
    Route::get('/orders-toko/due/pay/{order_id}', [OrderTokoController::class, 'dueOrderDetails'])->name('orderToko.dueOrderDetails');
    Route::put('/orders-toko/due/pay/update', [OrderTokoController::class, 'updateDueOrder'])->name('orderToko.updateDueOrder');
    Route::put('/orders-toko/update', [OrderTokoController::class, 'updateOrder'])->name('orderToko.updateOrder');
    Route::get('/orders-toko/print-invoice/{id}', [OrderTokoController::class, 'printInvoice'])->name('orderToko.printInvoice');
    // End

    // Order Surat Jalan
    Route::post('/orders-toko/delivery-order/store', [OrderTokoController::class, 'storeDO'])->name('delivery-orderToko.store');
    Route::get('/orders-toko/delivery-order/create/{order_id}', [OrderTokoController::class, 'createDelivery'])->name('delivery-orderToko.create');
    Route::get('/orders-toko/delivery-order/{order_id}', [OrderTokoController::class, 'deliveryOrder'])->name('orderToko.deliveryOrder');
    // End

    // Route Reports
    Route::get('/reports-toko/sales', [ReportSalesTokoController::class, 'allSales'])->name('reportsToko.sales');
    Route::post('/sales-toko/export', [ReportSalesTokoController::class, 'ExportSalesReport'])->name('salesToko.ExportSalesReport');
    // End

    // Add to cart purchase
    Route::post('/add-cart/purchase', [ProductTokoController::class, 'addToCartPurchase'])->name('purchasesToko.addCartItem');
    Route::delete('/remove-item-cart/purchase/{id}', [ProductTokoController::class, 'removeCartPurchase'])->name('purchasesToko.removeCartItem');
    // End
});
