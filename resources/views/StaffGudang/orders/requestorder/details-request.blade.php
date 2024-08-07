@extends('dashboard.body.main')

@section('content')
    <!-- BEGIN: Header -->
    <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
        <div class="container-xl px-4">
            <div class="page-header-content">
                <div class="row align-items-center justify-content-between pt-3">
                    <div class="col-auto mb-3">
                        <h1 class="page-header-title">
                            <div class="page-header-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" class="feather feather-file">
                                    <path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
                                    <polyline points="13 2 13 9 20 9"></polyline>
                                </svg>
                            </div>
                            Order Details
                        </h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- END: Header -->

    <!-- BEGIN: Main Page Content -->
    <div class="container-xl px-4">
        <div class="row">

            <!-- BEGIN: Information Supplier -->
            <div class="col-xl-12">
                <div class="card mb-4">
                    <div class="card-header">
                        Information Toko
                    </div>
                    <div class="card-body">
                        <!-- Form Row -->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (supplier name) -->
                            <div class="col-md-6">
                                <label class="small mb-1">Name</label>
                                <div class="form-control form-control-solid">{{ $orders->toko->name }}</div>
                            </div>
                            <!-- Form Group (supplier email) -->
                            <div class="col-md-6">
                                <label class="small mb-1">Email</label>
                                <div class="form-control form-control-solid">{{ $orders->toko->email }}</div>
                            </div>
                        </div>
                        <!-- Form Row -->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (supplier phone number) -->
                            <div class="col-md-6">
                                <label class="small mb-1">Phone</label>
                                <div class="form-control form-control-solid">{{ $orders->toko->phone }}</div>
                            </div>
                            <!-- Form Group (order date) -->
                            <div class="col-md-6">
                                <label class="small mb-1">Order Date</label>
                                <div class="form-control form-control-solid">{{ $orders->purchase_date }}</div>
                            </div>
                        </div>
                        <!-- Form Row -->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (no invoice) -->
                            <div class="col-md-6">
                                <label class="small mb-1">No Purchase</label>
                                <div class="form-control form-control-solid">{{ $orders->purchase_no }}</div>
                            </div>
                            <!-- Form Group (paid amount) -->
                            <div class="col-md-6 mb-3">
                                <label class="small mb-1">Total Hutang</label>
                                <div class="form-control form-control-solid">{{ $orders->paid }}</div>
                            </div>
                            <div class="col-md-6">
                                <label class="small mb-1">Total Bayar</label>
                                <div class="form-control form-control-solid">{{ $orders->total_amount_paid }}</div>
                            </div>
                        </div>
                        <!-- Form Row -->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (due amount) -->
                            <div class="col-md-6">
                                <label class="small mb-1">Created By</label>
                                <div class="form-control form-control-solid">{{ $orders->user_created->name }}</div>
                            </div>
                            <!-- Form Group (paid amount) -->
                            <div class="col-md-6">
                                <label class="small mb-1">Updated By</label>
                                <div class="form-control form-control-solid">
                                    {{ $orders->user_updated ? $orders->user_updated->name : '-' }}</div>
                            </div>
                        </div>
                        <!-- Form Group (address) -->
                        <div class="mb-3">
                            <label class="small mb-1">Address</label>
                            <div class="form-control form-control-solid">{{ $orders->toko->address }}</div>
                        </div>

                        @if ($orders->purchase_status == 0)
                            <form action="{{ route('requestOrderProcess', $orders->id) }}" method="POST">
                                @csrf
                                @method('put')
                                <input type="hidden" name="id" value="{{ $orders->id }}">
                                <!-- Submit button -->
                                <button type="submit" class="btn btn-success"
                                    onclick="return confirm('Are you sure you want to approve this purchase?')">
                                    Process Request
                                </button>
                                <a class="btn btn-primary" href="{{ URL::previous() }}">Back</a>
                            </form>
                        @elseif($orders->purchase_status == 1)
                            <a class="btn btn-primary" href="{{ URL::previous() }}">Back</a>
                        @elseif($orders->purchase_status == 2)
                            <a class="btn btn-primary" href="{{ URL::previous() }}">Back</a>
                        @elseif($orders->purchase_status == 3)
                            <a class="btn btn-primary" href="{{ URL::previous() }}">Back</a>
                        @elseif($orders->purchase_status == 4)
                            <form action="{{ route('purchasesToko.updatePurchase') }}" method="POST">
                                @csrf
                                @method('put')
                                <input type="hidden" name="id" value="{{ $orders->id }}">
                                <!-- Submit button -->
                                <button type="submit" class="btn btn-success"
                                    onclick="return confirm('Are you sure you want to approve this purchase?')">
                                    Verifikasi Barang Datang
                                </button>
                                <a class="btn btn-primary" href="{{ URL::previous() }}">Back</a>
                            </form>
                        @elseif($orders->paid !== 0)
                            <form action="{{ route('purchasesToko.updatePurchasePaid') }}" method="POST">
                                @csrf
                                @method('put')
                                <input type="hidden" name="id" value="{{ $orders->id }}">

                                <!-- Add input field for amount paid -->
                                <div class="form-group">
                                    <label for="amount_paid">Amount Paid:</label>
                                    <input type="number" name="amount_paid" class="form-control form-control-solid my-4"
                                        min="0" max="{{ $orders->paid }}" required>
                                </div>

                                <!-- Submit button -->
                                <button type="submit" class="btn btn-warning my-2">
                                    Pay Bills
                                </button>
                            </form>

                            <a class="btn btn-primary" href="{{ URL::previous() }}">Back</a>
                            <a class="btn btn-danger"
                                href="{{ route('purchasesToko.createReturn', $orders->id) }}">Retur</a>
                        @else
                            <a class="btn btn-primary" href="{{ URL::previous() }}">Back</a>
                            <a class="btn btn-danger"
                                href="{{ route('purchasesToko.createReturn', $orders->id) }}">Retur</a>
                        @endif
                        @if ($orders->arrival_date != null)
                            <a class="btn btn-success mt-1"
                                href="{{ route('purchasesToko.invoiceBill', $orders->id) }}">Tagihan</a>
                        @endif
                    </div>
                </div>
            </div>
            <!-- END: Information Supplier -->


            <!-- BEGIN: Table Product -->
            <div class="col-xl-12">
                <div class="card mb-4 mb-xl-0">
                    <div class="card-header">List Product</div>

                    <div class="card-body">
                        <!-- BEGIN: Products List -->
                        <div class="col-lg-12">
                            <div class="table-responsive">
                                <table class="table table-striped align-middle">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">No.</th>
                                            <th scope="col">Photo</th>
                                            <th scope="col">Product Name</th>
                                            <th scope="col">Product Code</th>
                                            <th scope="col">Current Stock</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($orderDetails as $item)
                                            <tr>
                                                <td scope="row">{{ $loop->iteration }}</td>
                                                <td scope="row">
                                                    <div style="max-height: 80px; max-width: 80px;">
                                                        <img class="img-fluid"
                                                            src="{{ $item->product->product_image ? asset('storage/products/' . $item->product->product_image) : asset('assets/img/products/default.webp') }}">
                                                    </div>
                                                </td>
                                                <td scope="row">{{ $item->product->product_name }}</td>
                                                <td scope="row">{{ $item->product->product_code }}</td>
                                                <td scope="row"><span
                                                        class="btn btn-warning">{{ $item->product->stock }}</span></td>
                                                <td scope="row"><span
                                                        class="btn btn-success">{{ $item->quantity }}</span>
                                                </td>
                                                <td scope="row">{{ $item->unitcost }}</td>
                                                <td scope="row">
                                                    <span class="btn btn-primary">{{ $item->total }}</span>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- END: Products List -->
                    </div>
                </div>
            </div>
            <!-- END: Table Product -->
        </div>
    </div>
    <!-- END: Main Page Content -->
@endsection
