<?php

use App\Http\Controllers\Owner\CategoryController;
use App\Http\Controllers\Owner\GudangController;
use App\Http\Controllers\Owner\ListTokoController;
use App\Http\Controllers\Owner\OrderController;
use App\Http\Controllers\Owner\PosController;
use App\Http\Controllers\Owner\ProductController;
use App\Http\Controllers\Owner\PurchaseController;
use App\Http\Controllers\Owner\ReportPurchaseController;
use App\Http\Controllers\Owner\ReportSalesController;
use App\Http\Controllers\Owner\ReturnPurchaseController;
use App\Http\Controllers\Owner\SupplierController;
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
    // Route List Gudang
    Route::resource('list-gudang', GudangController::class);
    Route::put('change-status-gudang/{id}', [GudangController::class, 'changeStatus'])->name('change-status-gudang');
    // End

    // Route List Toko
    Route::resource('list-toko', ListTokoController::class);
    Route::put('change-status-toko/{id}', [ListTokoController::class, 'changeStatus'])->name('change-status-toko');
    // End

    // Route Suppliers
    Route::resource('suppliers', SupplierController::class);
    Route::put('change-status-supplier/{id}', [SupplierController::class, 'changeStatus'])->name('change-status-supplier');
    // End

    // Route Categories
    Route::resource('categories', CategoryController::class);
    // End

    // Route Products
    Route::get('/products/export', [ProductController::class, 'export'])->name('products.export');
    Route::get('/products/import', [ProductController::class, 'import'])->name('products.import');
    Route::post('/products/import', [ProductController::class, 'handleImport'])->name('products.handleImport');
    Route::resource('/products', ProductController::class);
    Route::get('/products/{name}', [ProductController::class, 'show'])->name('products.show');
    Route::put('change-status-product/{id}', [ProductController::class, 'changeStatus'])->name('change-status-product');
    // End

    // Route Purchases
    Route::get('/purchases', [PurchaseController::class, 'allPurchases'])->name('purchases.allPurchases');
    Route::get('/purchases/approved', [PurchaseController::class, 'approvedPurchases'])->name('purchases.approvedPurchases');
    Route::get('/purchases/create', [PurchaseController::class, 'createPurchase'])->name('purchases.createPurchase');
    Route::post('/purchases', [PurchaseController::class, 'storePurchase'])->name('purchases.storePurchase');
    Route::put('/purchases/update', [PurchaseController::class, 'updatePurchase'])->name('purchases.updatePurchase');
    Route::put('/purchases-paid/update', [PurchaseController::class, 'updatePurchasePaid'])->name('purchases.updatePurchasePaid');
    Route::get('/purchases/details/{purchase_id}', [PurchaseController::class, 'purchaseDetails'])->name('purchases.purchaseDetails');
    Route::delete('/purchases/delete/{purchase_id}', [PurchaseController::class, 'deletePurchase'])->name('purchases.deletePurchase');
    //Return Purchases
    Route::get('/purchases/return/{purchase_id}', [PurchaseController::class, 'returnPurchase'])->name('purchases.createReturn');
    Route::post('/purchases/return/create', [ReturnPurchaseController::class, 'clonePurchaseToReturn'])->name('purchases.returnProduct');

    Route::get('/purchases/report', [PurchaseController::class, 'dailyPurchaseReport'])->name('purchases.dailyPurchaseReport');
    Route::post('/purchases-daily/export', [PurchaseController::class, 'dailyExportPurchaseReport'])->name('purchases.dailyExportPurchaseReport');
    Route::get('/purchases/jatuh-tempo', [PurchaseController::class, 'dueDateReport'])->name('purchases.dueDate');
    Route::post('/purchases-due/export', [PurchaseController::class, 'dueExportPurchaseReport'])->name('purchases.dueExportPurchaseReport');
    Route::get('/purchases-get/report/export', [PurchaseController::class, 'getPurchaseReport'])->name('purchases.getPurchaseReport');
    Route::post('/purchases/report/export', [PurchaseController::class, 'exportPurchaseReport'])->name('purchases.exportPurchaseReport');
    //    invoice
    Route::get('/invoice-bill/{purchase_id}', [PurchaseController::class, 'invoiceBill'])->name('purchases.invoiceBill');
    Route::get('/invoice-bill/{purchase_id}/pdf', [PurchaseController::class, 'invoiceBillPdf'])->name('purchases.invoiceBillPdf');
    //    PO Letter
    Route::get('/PO/{purchase_id}', [PurchaseController::class, 'PO'])->name('purchases.PO');
    // End

    // Route POS
    Route::get('/pos', [PosController::class, 'index'])->name('pos.index');
    Route::post('/pos/cart/add', [PosController::class, 'addCartItem'])->name('pos.addCartItem');
    Route::post('/pos/cart/update/{rowId}', [PosController::class, 'updateCartItem'])->name('pos.updateCartItem');
    Route::delete('/pos/cart/delete/{rowId}', [PosController::class, 'deleteCartItem'])->name('pos.deleteCartItem');
    Route::post('/pos/invoice', [PosController::class, 'createInvoice'])->name('pos.createInvoice');
    Route::get('/pos-detail/invoice', [PosController::class, 'getInvoice'])->name('pos.getInvoice');
    Route::post('/pos/create', [OrderController::class, 'createOrder'])->name('pos.createOrder');
    //  End

    // Route Orders
    Route::get('/orders/pending', [OrderController::class, 'pendingOrders'])->name('order.pendingOrders');
    Route::get('/orders/pending/{order_id}', [OrderController::class, 'orderDetails'])->name('order.orderPendingDetails');
    Route::get('/orders/complete', [OrderController::class, 'completeOrders'])->name('order.completeOrders');
    Route::get('/orders/complete/{order_id}', [OrderController::class, 'orderDetails'])->name('order.orderCompleteDetails');
    Route::get('/orders/details/{order_id}/download', [OrderController::class, 'downloadInvoice'])->name('order.downloadInvoice');
    Route::get('/orders/due', [OrderController::class, 'dueOrders'])->name('order.dueOrders');
    Route::get('/orders/due/pay/{order_id}', [OrderController::class, 'dueOrderDetails'])->name('order.dueOrderDetails');
    Route::put('/orders/due/pay/update', [OrderController::class, 'updateDueOrder'])->name('order.updateDueOrder');
    Route::put('/orders/update', [OrderController::class, 'updateOrder'])->name('order.updateOrder');
    // End

    // Order Surat Jalan
    Route::post('/orders/delivery-order/store', [OrderController::class, 'storeDO'])->name('delivery-order.store');
    Route::get('/orders/delivery-order/create/{order_id}', [OrderController::class, 'createDelivery'])->name('delivery-order.create');
    Route::get('/orders/delivery-order/{order_id}', [OrderController::class, 'deliveryOrder'])->name('order.deliveryOrder');
    // End

    // Route Reports
    Route::get('/reports/purchase', [ReportPurchaseController::class, 'allPurchases'])->name('reports.purchase');
    Route::get('/reports/sales', [ReportSalesController::class, 'allSales'])->name('reports.sales');
    Route::post('/sales/export', [ReportSalesController::class, 'ExportSalesReport'])->name('sales.ExportSalesReport');
    // End
});
