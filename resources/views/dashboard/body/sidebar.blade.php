<nav class="sidenav shadow-right sidenav-light">
    <div class="sidenav-menu">
        <div class="nav accordion" id="accordionSidenav">
            <!-- Sidenav Menu Heading (Core)-->
            <div class="sidenav-menu-heading">Home</div>
            {{-- @can('create')
                <a class="nav-link {{ Request::is('dashboard*') ? 'active' : '' }}" href="{{ route('dashboard') }}">
                    <div class="nav-link-icon"><i data-feather="activity"></i></div>
                    Halaman Utama
                </a>
            @endcan --}}

            <a class="nav-link {{ Request::is('dashboard*') ? 'active' : '' }}" href="{{ route('dashboard') }}">
                <div class="nav-link-icon"><i data-feather="activity"></i></div>
                Halaman Utama
            </a>

            @role('Owner')
                <div class="sidenav-menu-heading">Management Products</div>
                <a class="nav-link {{ Request::is('products*') ? 'active' : '' }}" href="{{ route('products.index') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-boxes-stacked"></i></div>
                    Produk
                </a>
                <a class="nav-link {{ Request::is('categories*') ? 'active' : '' }}" href="{{ route('categories.index') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-folder"></i></div>
                    Kategori
                </a>

                <div class="sidenav-menu-heading">Management User</div>
                <a class="nav-link {{ Request::is('users*') ? 'active' : '' }}" href="{{ route('users.index') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-users"></i></div>
                    Pengguna
                </a>

                <!-- Sidenav Heading (Orders)-->
                <div class="sidenav-menu-heading">Penjualan</div>
                <a class="nav-link {{ Request::is('pos*') ? 'active' : '' }}" href="{{ route('pos.index') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-cart-shopping"></i></div>
                    Penjualan
                </a>
                <a class="nav-link {{ Request::is('orders/complete*') ? 'active' : '' }}"
                    href="{{ route('order.completeOrders') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-circle-check"></i></div>
                    Selesai
                </a>
                <a class="nav-link {{ Request::is('orders/pending*') ? 'active' : '' }}"
                    href="{{ route('order.pendingOrders') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-clock"></i></div>
                    Ditunda
                </a>
                <a class="nav-link {{ Request::is('orders/due*') ? 'active' : '' }}"
                    href="{{ route('order.dueOrders') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-credit-card"></i></div>
                    Penjualan Jatuh Tempo
                </a>

                <!-- Sidenav Heading (Purchases)-->
                <div class="sidenav-menu-heading">Pembelian</div>
                <a class="nav-link {{ Request::is('purchases', 'purchase/create*', 'purchases/details*') ? 'active' : '' }}"
                    href="{{ route('purchases.allPurchases') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-cash-register"></i></div>
                    Semua Pembelian
                </a>
                <a class="nav-link {{ Request::is('purchases/approved*') ? 'active' : '' }}"
                    href="{{ route('purchases.approvedPurchases') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-circle-check"></i></div>
                    Disetujui Barang Datang
                </a>
                <a class="nav-link {{ Request::is('purchases/report*') ? 'active' : '' }}"
                    href="{{ route('purchases.dailyPurchaseReport') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-flag"></i></div>
                    Pembelian Hari Ini
                </a>
                <a class="nav-link {{ Request::is('purchases/jatuh-tempo*') ? 'active' : '' }}"
                    href="{{ route('purchases.dueDate') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-credit-card"></i></div>
                    Pembelian Jatuh Tempo
                </a>

                <div class="sidenav-menu-heading">Management Gudang</div>
                <a class="nav-link {{ Request::is('list-gudang*') ? 'active' : '' }}"
                    href="{{ route('list-gudang.index') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-users"></i></div>
                    List Gudang
                </a>

                <div class="sidenav-menu-heading">Management Supplier</div>
                <a class="nav-link {{ Request::is('suppliers*') ? 'active' : '' }}" href="{{ route('suppliers.index') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-users"></i></div>
                    List Supplier
                </a>

                <div class="sidenav-menu-heading">Management Toko</div>
                <a class="nav-link {{ Request::is('list-toko*') ? 'active' : '' }}" href="{{ route('list-toko.index') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-users"></i></div>
                    List Toko
                </a>

                <div class="sidenav-menu-heading">Laporan</div>
                <a class="nav-link {{ Request::is('reports/sales*') ? 'active' : '' }}"
                    href="{{ route('reports.sales') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-cash-register"></i></div>
                    Semua Penjualan
                </a>
                <a class="nav-link {{ Request::is('reports/purchase*') ? 'active' : '' }}"
                    href="{{ route('reports.purchase') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-cash-register"></i></div>
                    Laporan Pembelian
                </a>
            @endrole

            @role('Admin_Toko')
                <div class="sidenav-menu-heading">Management Products</div>
                <a class="nav-link {{ Request::is('products-toko*') ? 'active' : '' }}"
                    href="{{ route('products-toko.index') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-boxes-stacked"></i></div>
                    Produk
                </a>
                <a class="nav-link {{ Request::is('categories*') ? 'active' : '' }}"
                    href="{{ route('categories.index') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-folder"></i></div>
                    Kategori
                </a>

                <!-- Sidenav Heading (Orders)-->
                <div class="sidenav-menu-heading">Penjualan</div>
                <a class="nav-link {{ Request::is('posToko*') ? 'active' : '' }}" href="{{ route('posToko.index') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-cart-shopping"></i></div>
                    Penjualan
                </a>
                <a class="nav-link {{ Request::is('orders-toko/complete*') ? 'active' : '' }}"
                    href="{{ route('orderToko.completeOrders') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-circle-check"></i></div>
                    Selesai
                </a>
                <a class="nav-link {{ Request::is('orders-toko/pending*') ? 'active' : '' }}"
                    href="{{ route('orderToko.pendingOrders') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-clock"></i></div>
                    Ditunda
                </a>
                <a class="nav-link {{ Request::is('orders-toko/due*') ? 'active' : '' }}"
                    href="{{ route('orderToko.dueOrders') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-credit-card"></i></div>
                    Penjualan Jatuh Tempo
                </a>

                <!-- Sidenav Heading (Purchases)-->
                <div class="sidenav-menu-heading">Order Gudang</div>
                <a class="nav-link {{ Request::is('purchases-toko', 'purchases-toko/create*', 'purchases-toko/details*') ? 'active' : '' }}"
                    href="{{ route('purchasesToko.allPurchases') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-cash-register"></i></div>
                    Semua Order
                </a>
                <a class="nav-link {{ Request::is('purchases-toko/approved*') ? 'active' : '' }}"
                    href="{{ route('purchasesToko.approvedPurchases') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-circle-check"></i></div>
                    Disetujui Barang Datang
                </a>
                <a class="nav-link {{ Request::is('purchases-toko/report*') ? 'active' : '' }}"
                    href="{{ route('purchasesToko.dailyPurchaseReport') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-flag"></i></div>
                    Order Hari Ini
                </a>
                <a class="nav-link {{ Request::is('purchases-toko/jatuh-tempo*') ? 'active' : '' }}"
                    href="{{ route('purchasesToko.dueDate') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-credit-card"></i></div>
                    Order Jatuh Tempo
                </a>

                <div class="sidenav-menu-heading">Laporan</div>
                <a class="nav-link {{ Request::is('reports-toko/sales*') ? 'active' : '' }}"
                    href="{{ route('reportsToko.sales') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-cash-register"></i></div>
                    Semua Penjualan
                </a>
            @endrole

            @role('Admin_Gud')
                @php
                    $gudangid = App\Models\Gudang::where('user_id', auth()->user()->id)->first();
                    $notif = App\Models\Purchase::where('gudang_id', $gudangid->id)
                        ->where('purchase_status', '0')
                        ->count();
                @endphp
                <div class="sidenav-menu-heading">Management Products</div>
                <a class="nav-link {{ Request::is('products-gudang*') ? 'active' : '' }}"
                    href="{{ route('products-gudang.index') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-boxes-stacked"></i></div>
                    Produk Gudang
                </a>
                <a class="nav-link {{ Request::is('stock-toko*') ? 'active' : '' }}"
                    href="{{ route('stockToko.index') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-boxes-stacked"></i></div>
                    Stok Toko
                </a>
                <a class="nav-link {{ Request::is('categories*') ? 'active' : '' }}"
                    href="{{ route('categories.index') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-folder"></i></div>
                    Kategori
                </a>

                <!-- Sidenav Heading (Purchases)-->
                <div class="sidenav-menu-heading">Pembelian</div>
                <a class="nav-link {{ Request::is('purchases-gudang', 'purchases-gudang/create*') ? 'active' : '' }}"
                    href="{{ route('purchasesGudang.allPurchases') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-cash-register"></i></div>
                    Semua Pembelian
                </a>
                <a class="nav-link {{ Request::is('purchases-gudang/approved*') ? 'active' : '' }}"
                    href="{{ route('purchasesGudang.approvedPurchases') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-circle-check"></i></div>
                    Disetujui Barang Datang
                </a>
                <a class="nav-link {{ Request::is('purchases-gudang/report*') ? 'active' : '' }}"
                    href="{{ route('purchasesGudang.dailyPurchaseReport') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-flag"></i></div>
                    Pembelian Hari Ini
                </a>
                <a class="nav-link {{ Request::is('purchases-gudang/jatuh-tempo*') ? 'active' : '' }}"
                    href="{{ route('purchasesGudang.dueDate') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-credit-card"></i></div>
                    Pembelian Jatuh Tempo
                </a>

                <div class="sidenav-menu-heading">Management Supplier</div>
                <a class="nav-link {{ Request::is('suppliers*') ? 'active' : '' }}"
                    href="{{ route('suppliers.index') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-users"></i></div>
                    List Supplier
                </a>

                <div class="sidenav-menu-heading">Order Toko</div>
                <a class="nav-link {{ Request::is('request/order*') ? 'active' : '' }}"
                    href="{{ route('requestOrder.index') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-cash-register"></i></div>
                    Request Order&nbsp;<span class="badge bg-danger"><b>{{ $notif }}</b></span>
                </a>
                <a class="nav-link {{ Request::is('pos-gudang*') ? 'active' : '' }}"
                    href="{{ route('posGudang.index') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-cart-shopping"></i></div>
                    Penjualan
                </a>
                <a class="nav-link {{ Request::is('orders-gudang/complete*') ? 'active' : '' }}"
                    href="{{ route('orderGudang.completeOrders') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-circle-check"></i></div>
                    Selesai
                </a>
                <a class="nav-link {{ Request::is('orders-gudang/pending*') ? 'active' : '' }}"
                    href="{{ route('orderGudang.pendingOrders') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-clock"></i></div>
                    Ditunda
                </a>
                <a class="nav-link {{ Request::is('orders-gudang/due*') ? 'active' : '' }}"
                    href="{{ route('orderGudang.dueOrders') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-credit-card"></i></div>
                    Penjualan Jatuh Tempo
                </a>

                <div class="sidenav-menu-heading">Laporan</div>
                <a class="nav-link {{ Request::is('reports-gudang/sales*') ? 'active' : '' }}"
                    href="{{ route('reportsGudang.sales') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-cash-register"></i></div>
                    Semua Penjualan
                </a>
                <a class="nav-link {{ Request::is('reports-gudang/purchase*') ? 'active' : '' }}"
                    href="{{ route('reportsGudang.purchase') }}">
                    <div class="nav-link-icon"><i class="fa-solid fa-cash-register"></i></div>
                    Laporan Pembelian
                </a>
            @endrole

            {{-- <!-- Sidenav Heading (Orders)-->
            <div class="sidenav-menu-heading">Penjualan</div>
            <a class="nav-link {{ Request::is('orders/complete*') ? 'active' : '' }}"
                href="{{ route('order.completeOrders') }}">
                <div class="nav-link-icon"><i class="fa-solid fa-circle-check"></i></div>
                Selesai
            </a>
            <a class="nav-link {{ Request::is('orders/pending*') ? 'active' : '' }}"
                href="{{ route('order.pendingOrders') }}">
                <div class="nav-link-icon"><i class="fa-solid fa-clock"></i></div>
                Ditunda
            </a>
            <a class="nav-link {{ Request::is('orders/due*') ? 'active' : '' }}"
                href="{{ route('order.dueOrders') }}">
                <div class="nav-link-icon"><i class="fa-solid fa-credit-card"></i></div>
                Penjualan Jatuh Tempo
            </a>
            <!-- Sidenav Heading (Purchases)-->
            <div class="sidenav-menu-heading">Pembelian</div>
            <a class="nav-link {{ Request::is('purchases', 'purchase/create*', 'purchases/details*') ? 'active' : '' }}"
                href="{{ route('purchases.allPurchases') }}">
                <div class="nav-link-icon"><i class="fa-solid fa-cash-register"></i></div>
                Semua Pembelian
            </a>
            <a class="nav-link {{ Request::is('purchases/approved*') ? 'active' : '' }}"
                href="{{ route('purchases.approvedPurchases') }}">
                <div class="nav-link-icon"><i class="fa-solid fa-circle-check"></i></div>
                Disetujui Barang Datang
            </a>
            <a class="nav-link {{ Request::is('purchases/report*') ? 'active' : '' }}"
                href="{{ route('purchases.dailyPurchaseReport') }}">
                <div class="nav-link-icon"><i class="fa-solid fa-flag"></i></div>
                Pembelian Hari Ini
            </a>
            <a class="nav-link {{ Request::is('purchases/jatuh-tempo*') ? 'active' : '' }}"
                href="{{ route('purchases.dueDate') }}">
                <div class="nav-link-icon"><i class="fa-solid fa-credit-card"></i></div>
                Pembelian Jatuh Tempo
            </a> --}}

            <!-- Sidenav Accordion (Pages)-->
            {{-- <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                <div class="nav-link-icon"><i data-feather="grid"></i></div>
                People
                <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
            </a>
            <div class="collapse" id="collapsePages" data-bs-parent="#accordionSidenav">
                <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPagesCustomers">
                    <!-- Nested Sidenav Accordion (Pages -> People)-->
                    <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#pagesCollapseCustomers" aria-expanded="false" aria-controls="pagesCollapseCustomers">
                        Customers
                        <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="pagesCollapseCustomers" data-bs-parent="#accordionSidenavPagesCustomers">
                        <nav class="sidenav-menu-nested nav">
                            <a class="nav-link" href="#">Show All</a>
                        </nav>
                    </div>
                    <a class="nav-link" href="#">Customers</a>
                    <a class="nav-link" href="#">Suppliers</a>
                </nav>
            </div> --}}

            {{-- <!-- Sidenav Heading (Pages)-->
            <div class="sidenav-menu-heading">User</div>
            <a class="nav-link {{ Request::is('customers*') ? 'active' : '' }}"
                href="{{ route('customers.index') }}">
                <div class="nav-link-icon"><i class="fa-solid fa-users"></i></div>
                Pelanggan
            </a>
            <a class="nav-link {{ Request::is('suppliers*') ? 'active' : '' }}"
                href="{{ route('suppliers.index') }}">
                <div class="nav-link-icon"><i class="fa-solid fa-users"></i></div>
                Penyuplai
            </a>
            <a class="nav-link {{ Request::is('agens*') ? 'active' : '' }}" href="{{ route('agens.index') }}">
                <div class="nav-link-icon"><i class="fa-solid fa-users"></i></div>
                Sales Marketing
            </a>

            <!-- Sidenav Heading (Products)-->
            <div class="sidenav-menu-heading">Products</div>
            <a class="nav-link {{ Request::is('products*') ? 'active' : '' }}"
                href="{{ route('products.index') }}">
                <div class="nav-link-icon"><i class="fa-solid fa-boxes-stacked"></i></div>
                Produk
            </a>
            <a class="nav-link {{ Request::is('productions*') ? 'active' : '' }}"
                href="{{ route('productions.index') }}" disabled>
                <div class="nav-link-icon"><i class="fa-solid fa-boxes-stacked"></i></div>
                Proses Produksi
            </a>
            <a class="nav-link {{ Request::is('categories*') ? 'active' : '' }}"
                href="{{ route('categories.index') }}">
                <div class="nav-link-icon"><i class="fa-solid fa-folder"></i></div>
                Kategori
            </a>
            <a class="nav-link {{ Request::is('units*') ? 'active' : '' }}" href="{{ route('units.index') }}">
                <div class="nav-link-icon"><i class="fa-solid fa-folder"></i></div>
                Satuan
            </a>

            <!-- Sidenav Heading (Settings)-->
            <div class="sidenav-menu-heading">Settings</div>
            <a class="nav-link {{ Request::is('users*') ? 'active' : '' }}" href="{{ route('users.index') }}">
                <div class="nav-link-icon"><i class="fa-solid fa-users"></i></div>
                Pengguna
            </a>
            <a class="nav-link {{ Request::is('roles*') ? 'active' : '' }}" href="{{ route('roles.index') }}">
                <div class="nav-link-icon"><i class="fa-solid fa-users-gear"></i></div>
                Roles
            </a>
            <a class="nav-link {{ Request::is('values*') ? 'active' : '' }}" href="{{ route('values.index') }}">
                <div class="nav-link-icon"><i class="fa-solid fa-users-gear"></i></div>
                Master Value
            </a> --}}
        </div>
    </div>

    <!-- Sidenav Footer-->
    <div class="sidenav-footer">
        <div class="sidenav-footer-content">
            <div class="sidenav-footer-subtitle">Masuk Sebagai:</div>
            <div class="sidenav-footer-title">{{ auth()->user()->name }}</div>
        </div>
    </div>
</nav>
