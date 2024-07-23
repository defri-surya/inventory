<nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white"
    id="sidenavAccordion">
    <!-- Sidenav Toggle Button-->
    <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle"><i
            data-feather="menu"></i></button>
    <!-- Navbar Brand-->
    <!-- * * Tip * * You can use text or an image for your navbar brand.-->
    <!-- * * * * * * When using an image, we recommend the SVG format.-->
    <!-- * * * * * * Dimensions: Maximum height: 32px, maximum width: 240px-->
    <a class="navbar-brand pe-3 ps-4 ps-lg-2" href="{{ route('dashboard') }}">Stok Manajemen</a>
    <!-- Navbar Search Input-->
    <!-- * * Note: * * Visible only on and above the lg breakpoint-->
    <form class="form-inline me-auto d-none d-lg-block me-3">
        <div class="input-group input-group-joined input-group-solid">
            <input class="form-control pe-0" type="search" placeholder="Search" aria-label="Search" />
            <div class="input-group-text"><i data-feather="search"></i></div>
        </div>
    </form>

    <!-- Navbar Items-->
    <ul class="navbar-nav align-items-center ms-auto">
        @php
            use Illuminate\Support\Carbon;
            use Illuminate\Support\Facades\Cache;
            use App\Models\Product;
            use App\Models\ProductToko;
            use App\Models\ListToko;
            use App\Models\Gudang;
            use App\Models\Purchase;
        @endphp
        @role('Owner')
            @php
                $cacheDuration = 10;

                // Mengambil hasil dari cache atau menjalankan query jika cache tidak tersedia
                // Menyimpan hasil query ke dalam cache
                $countlowStockProducts = Product::where('stock', '<=', 'min_stock')->count();
                $countdueDatePurchase = Purchase::where('purchase_due_date', '!=', null)
                    ->where('purchase_due_date', '<', Carbon::now())
                    ->count();
                $result = $countdueDatePurchase + $countlowStockProducts;
                // dd($result);

                $notifications = Cache::remember('low_product_notif_owner', $cacheDuration * 60, function () {
                    // Fetch products where stock is less than or equal to the min_stock
                    $lowStockProducts = Product::where('stock', '<=', 'min_stock')->get();

                    // Fetch purchases with due dates earlier than the current date and time
                    $dueDatePurchase = Purchase::where('purchase_due_date', '!=', null)
                        ->where('purchase_due_date', '<', Carbon::now())
                        ->get();

                    // Combine low stock products and due date purchases into a single array
                    return array_merge($lowStockProducts->toArray(), $dueDatePurchase->toArray());
                });
            @endphp
            <!-- User Profile Image with Notification Icon -->
            <li class="nav-item mx-5">
                <button type="button" class="btn btn-sm rounded position-relative" data-bs-toggle="modal"
                    data-bs-target="#modalNotification">
                    <i class="fa fa-bell fs-6"></i>
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                        {{ $result }}
                        <span class="visually-hidden">unread messages</span>
                    </span>
                </button>
            </li>

            <!-- Modal -->
            <div class="modal fade" id="modalNotification" tabindex="-1" aria-labelledby="modalNotificationLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Notifications</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-dark">
                            <ul>
                                @foreach ($notifications as $notification)
                                    <li>
                                        @if (isset($notification['product_name']))
                                            <strong>{{ $notification['product_name'] }}</strong> is low on
                                            stock. Current stock: {{ $notification['stock'] }}
                                        @elseif(isset($notification['purchase_due_date']))
                                            Batas Pembayaran Pembelian Barang Sudah Jatuh Tempo Pada:
                                            {{ $notification['purchase_due_date'] }}
                                        @endif
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        @endrole
        @role('Admin_Toko')
            @php
                $cacheDuration = 10;

                // Mengambil hasil dari cache atau menjalankan query jika cache tidak tersedia
                // Menyimpan hasil query ke dalam cache
                $tokoid = ListToko::where('user_id', Auth::user()->id)->first();
                $countlowStockProducts = ProductToko::where('stock', '<=', 'min_stock')
                    ->where('toko_id', $tokoid->id)
                    ->count();
                $countdueDatePurchase = Purchase::where('purchase_due_date', '!=', null)
                    ->where('toko_id', $tokoid->id)
                    ->where('purchase_due_date', '<', Carbon::now())
                    ->count();
                $result = $countdueDatePurchase + $countlowStockProducts;
                // dd($result);

                $notifications = Cache::remember('low_product_notif_toko', $cacheDuration * 60, function () {
                    // Fetch products where stock is less than or equal to the min_stock
                    $toko_id = ListToko::where('user_id', Auth::user()->id)->first();
                    $lowStockProducts = ProductToko::where('stock', '<=', 'min_stock')
                        ->where('toko_id', $toko_id->id)
                        ->get();

                    // Fetch purchases with due dates earlier than the current date and time
                    $dueDatePurchase = Purchase::where('toko_id', $toko_id->id)
                        ->where('purchase_due_date', '!=', null)
                        ->where('purchase_due_date', '<', Carbon::now())
                        ->get();

                    // Combine low stock products and due date purchases into a single array
                    return array_merge($lowStockProducts->toArray(), $dueDatePurchase->toArray());
                });
                // dd($notifications);
            @endphp
            <!-- User Profile Image with Notification Icon -->
            <li class="nav-item mx-5">
                <button type="button" class="btn btn-sm rounded position-relative" data-bs-toggle="modal"
                    data-bs-target="#modalNotification">
                    <i class="fa fa-bell fs-6"></i>
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                        {{ $result }}
                        <span class="visually-hidden">unread messages</span>
                    </span>
                </button>
            </li>

            <!-- Modal -->
            <div class="modal fade" id="modalNotification" tabindex="-1" aria-labelledby="modalNotificationLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Notifications</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-dark">
                            <ul>
                                @foreach ($notifications as $notification)
                                    <li>
                                        @if (isset($notification['product_name']))
                                            <strong>{{ $notification['product_name'] }}</strong> is low on
                                            stock. Current stock: {{ $notification['stock'] }}
                                        @elseif(isset($notification['purchase_due_date']))
                                            Batas Pembayaran Pembelian Barang Sudah Jatuh Tempo Pada:
                                            {{ $notification['purchase_due_date'] }}
                                        @endif
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        @endrole
        @role('Admin_Gud')
            @php
                $cacheDuration = 10;

                // Mengambil hasil dari cache atau menjalankan query jika cache tidak tersedia
                // Menyimpan hasil query ke dalam cache
                $gudangid = Gudang::where('user_id', Auth::user()->id)->first();
                $countlowStockProducts = Product::where('stock', '<=', 'min_stock')
                    ->where('gudang_id', $gudangid->id)
                    ->count();
                $countdueDatePurchase = Purchase::where('gudang_id', $gudangid->id)
                    ->where('purchase_due_date', '!=', null)
                    ->where('purchase_due_date', '<=', Carbon::now())
                    ->count();
                // dd($result);
                $result = $countdueDatePurchase + $countlowStockProducts;

                $notifications = Cache::remember('low_product_notif_gudang', $cacheDuration * 60, function () {
                    $gudang_id = Gudang::where('user_id', Auth::user()->id)->first();
                    // Fetch products where stock is less than or equal to the min_stock
                    $lowStockProducts = Product::where('stock', '<=', 'min_stock')
                        ->where('gudang_id', $gudang_id->id)
                        ->get();

                    // Fetch purchases with due dates earlier than the current date and time
                    $dueDatePurchase = Purchase::where('gudang_id', $gudang_id->id)
                        ->where('purchase_due_date', '!=', null)
                        ->where('purchase_due_date', '<=', Carbon::now())
                        ->get();

                    // Combine low stock products and due date purchases into a single array
                    return array_merge($lowStockProducts->toArray(), $dueDatePurchase->toArray());
                });
            @endphp
            <!-- User Profile Image with Notification Icon -->
            <li class="nav-item mx-5">
                <button type="button" class="btn btn-sm rounded position-relative" data-bs-toggle="modal"
                    data-bs-target="#modalNotification">
                    <i class="fa fa-bell fs-6"></i>
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                        {{ $result }}
                        <span class="visually-hidden">unread messages</span>
                    </span>
                </button>
            </li>

            <!-- Modal -->
            <div class="modal fade" id="modalNotification" tabindex="-1" aria-labelledby="modalNotificationLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Notifications</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-dark">
                            <ul>
                                @foreach ($notifications as $notification)
                                    <li>
                                        @if (isset($notification['product_name']))
                                            <strong>{{ $notification['product_name'] }}</strong> is low on
                                            stock. Current stock: {{ $notification['stock'] }}
                                        @elseif(isset($notification['purchase_due_date']))
                                            Batas Pembayaran Pembelian Barang Sudah Jatuh Tempo Pada:
                                            {{ $notification['purchase_due_date'] }}
                                        @endif
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        @endrole


        <!-- User Dropdown-->
        <li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
            <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage"
                href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false">
                <img class="img-fluid"
                    src="{{ auth()->user()->photo ? asset('storage/profile/' . auth()->user()->photo) : asset('assets/img/illustrations/profiles/profile-1.png') }}" /></a>
            <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up"
                aria-labelledby="navbarDropdownUserImage">
                <h6 class="dropdown-header d-flex align-items-center">
                    <img class="dropdown-user-img"
                        src="{{ auth()->user()->photo ? asset('storage/profile/' . auth()->user()->photo) : asset('assets/img/illustrations/profiles/profile-1.png') }}" />
                    <div class="dropdown-user-details">
                        <div class="dropdown-user-details-name">{{ auth()->user()->name }}</div>
                        <div class="dropdown-user-details-email">{{ auth()->user()->email }}</a></div>
                    </div>
                </h6>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="{{ route('profile.edit') }}">
                    <div class="dropdown-item-icon"><i data-feather="settings"></i></div>
                    Account
                </a>

                <!-- Logout -->
                <form action="{{ route('logout') }}" method="POST">
                    @csrf
                    <button class="dropdown-item" action="{{ route('logout') }}" method="POST"
                        onclick="return confirm('Are you sure you want to logout?')">
                        <div class="dropdown-item-icon"><i data-feather="log-out"></i></div>
                        Keluar
                    </button>
                </form>
            </div>
        </li>
    </ul>
</nav>


<!-- Activate Bootstrap tooltips and popovers -->
{{-- <script>
    // Function to fetch low stock products and due date purchases
    function fetchNotifications() {
        return fetch('/getNotifications')
            .then(response => response.json())
            .then(data => {
                console.log(data); // Log the response data
                return data.notifications;
            })
            .catch(error => {
                console.error('Error fetching notifications:', error);
                return [];
            });
    }

    // Function to update the notifications in the dropdown
    function updateNotifications() {
        const notificationList = document.getElementById('notification-list');
        notificationList.innerHTML = '';

        fetchNotifications()
            .then(notifications => {
                if (notifications.length > 0) {
                    notifications.forEach(notification => {
                        const notificationItem = document.createElement('div');
                        notificationItem.classList.add('dropdown-item');

                        if ('product_name' in notification) {
                            notificationItem.innerHTML = `
                        <strong>${notification.product_name}</strong> is low on stock. Current stock: ${notification.stock}
                    `;
                        } else if ('purchase_due_date' in notification) {
                            // Format the due date using toLocaleDateString
                            const formattedDueDate = new Date(notification.purchase_due_date)
                                .toLocaleDateString();

                            notificationItem.innerHTML = `
                        Batas Pembayaran Pembelian Barang Sudah Jatuh Tempo Pada: ${formattedDueDate}
                    `;
                        }

                        notificationList.appendChild(notificationItem);
                    });
                } else {
                    const noNotificationItem = document.createElement('div');
                    noNotificationItem.classList.add('dropdown-item', 'text-center', 'text-muted');
                    noNotificationItem.innerText = 'No notifications';
                    notificationList.appendChild(noNotificationItem);
                }

                const notificationCount = document.getElementById('notificationCount');
                notificationCount.innerText = notifications.length;
            });
    }

    // Call updateNotifications to show notifications on page load
    updateNotifications();

    // Event listener to update notifications when the dropdown is shown
    document.getElementById('notificationsDropdown').addEventListener('click', () => {
        updateNotifications();
    });
</script> --}}
