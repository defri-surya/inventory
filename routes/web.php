<?php

use App\Http\Controllers\AgenController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\DefaultController;
use App\Http\Controllers\DefaultTokoController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\PosController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProductionController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\PurchaseController;
use App\Http\Controllers\ReturnPurchaseController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\SupplierController;
use App\Http\Controllers\UnitController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\MasterValueController;
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

Route::get('/', function () {
    return view('auth.login');
});

Route::get('/dashboard', function () {
    return view('dashboard.index');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::get('/profile/settings', [ProfileController::class, 'settings'])->name('profile.settings');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::resource('/customers', CustomerController::class);
    Route::resource('/agens', AgenController::class);


    Route::resource('/units', UnitController::class);

    //Route Productions
    Route::resource('/productions', ProductionController::class);
    //    Route::get('/productions', [ProductionController::class, 'index'])->name('productions.index');
    //    Route::get('/productions/create', [ProductionController::class, 'create'])->name('productions.create');
    //    Route::post('/productions/store', [ProductionController::class, 'store'])->name('productions.store');
    //    Route::get('/productions/edit/{$id}', [ProductionController::class, 'edit'])->name('productions.edit');
    Route::put('/productions/update', [ProductionController::class, 'update'])->name('productions.update');
    //    Route::put('/productions/export', [ProductController::class, 'export'])->name('productions.export');
    //    Route::delete('/productions/export', [ProductController::class, 'export'])->name('productions.export');



    // Default Controller
    Route::get('/get-all-product', [DefaultController::class, 'GetProducts'])->name('get-all-product');
    Route::get('/get-all-product-toko', [DefaultTokoController::class, 'GetProductsToko'])->name('get-all-product-toko');




    // User Management
    Route::resource('/users', UserController::class)->except(['show']);
    Route::get('/users-toko', [UserController::class, 'createToko'])->name('createToko');
    Route::post('/users-store-toko', [UserController::class, 'storeToko'])->name('storeToko');
    Route::put('/user/change-password/{username}', [UserController::class, 'updatePassword'])->name('users.updatePassword');


    Route::resource('roles', RoleController::class);

    //  Route Values
    Route::get('/values', [MasterValueController::class, 'index'])->name('values.index');
    Route::get('/values/create', [MasterValueController::class, 'create'])->name('values.create');
    Route::post('/values/create/add', [MasterValueController::class, 'store'])->name('values.store');
    Route::post('/values/details/create/add', [MasterValueController::class, 'storeDetailMasterValue'])->name('valueDetails.store');
    Route::delete('/values/delete/{id}', [MasterValueController::class, 'destroy'])->name('values.destroy');
    Route::delete('/values/detail/delete/{id}', [MasterValueController::class, 'destroyDetail'])->name('valuesDetail.destroy');
    Route::get('/values/edit/{id}', [MasterValueController::class, 'edit'])->name('values.edit');
    Route::get('/values/show-details/{id}', [MasterValueController::class, 'showValueDetails'])->name('values.show');
    Route::put('/values/update/{id}', [MasterValueController::class, 'update'])->name('values.update');
    Route::post('/values/details/update', [MasterValueController::class, 'updateDetailMasterValue'])->name('values.updateDetail');

    Route::get('/getNotifications', [NotificationController::class, 'lowProductNotif'])->name('notif');
});


require __DIR__ . '/auth.php';
require __DIR__ . '/owner.php';
require __DIR__ . '/staffToko.php';
require __DIR__ . '/staffGudang.php';
