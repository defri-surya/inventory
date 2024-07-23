@extends('dashboard.body.main')

@section('content')
    <!-- BEGIN: Header -->
    <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
        <div class="container-xl px-4">
            <div class="page-header-content pt-4">
                <div class="row align-items-center justify-content-between">
                    <div class="col-auto my-4">
                        <h1 class="page-header-title">
                            <div class="page-header-icon"><i class="fa-solid fa-boxes-stacked"></i></div>
                            Product List
                        </h1>
                    </div>
                    <div class="col-auto my-4">
                        <a href="{{ route('products.import') }}" class="btn btn-success add-list my-1"><i
                                class="fa-solid fa-file-import me-3"></i>Import</a>
                        <a href="{{ route('products.export') }}" class="btn btn-warning add-list my-1"><i
                                class="fa-solid fa-file-arrow-down me-3"></i>Export</a>
                        <a href="{{ route('products.create') }}" class="btn btn-primary add-list my-1"><i
                                class="fa-solid fa-plus me-3"></i>Add</a>
                        <a href="{{ route('products.index') }}" class="btn btn-danger add-list my-1"><i
                                class="fa-solid fa-trash me-3"></i>Clear Search</a>
                    </div>
                </div>

                <nav class="mt-4 rounded" aria-label="breadcrumb">
                    <ol class="breadcrumb px-3 py-2 rounded mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                        <li class="breadcrumb-item active">Products</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- BEGIN: Alert -->
        <div class="container-xl px-4 mt-n4">
            @if (session()->has('success'))
                <div class="alert alert-success alert-icon" role="alert">
                    <button class="btn-close" type="button" data-bs-dismiss="alert" aria-label="Close"></button>
                    <div class="alert-icon-aside">
                        <i class="far fa-flag"></i>
                    </div>
                    <div class="alert-icon-content">
                        {{ session('success') }}
                    </div>
                </div>
            @endif
        </div>
        <!-- END: Alert -->
    </header>
    <!-- END: Header -->


    <!-- BEGIN: Main Page Content -->
    <div class="container px-2 mt-n10">
        <div class="card mb-4">
            <div class="card-body">
                <div class="row mx-n4">
                    <div class="col-lg-12 card-header mt-n4">
                        <form action="{{ route('products.index') }}" method="GET">
                            <div class="d-flex flex-wrap align-items-center justify-content-between">
                                <div class="form-group row align-items-center">
                                    <label for="row" class="col-auto">Row:</label>
                                    <div class="col-auto">
                                        <select class="form-control" name="row">
                                            <option value="10"
                                                @if (request('row') == '10') selected="selected" @endif>10</option>
                                            <option value="25"
                                                @if (request('row') == '25') selected="selected" @endif>25</option>
                                            <option value="50"
                                                @if (request('row') == '50') selected="selected" @endif>50</option>
                                            <option value="100"
                                                @if (request('row') == '100') selected="selected" @endif>100</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row align-items-center justify-content-between">
                                    <label class="control-label col-sm-3" for="search">Search:</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input type="text" id="search" class="form-control me-1" name="search"
                                                placeholder="Search product" value="{{ request('search') }}">
                                            <div class="input-group-append">

                                                <!-- Modal button search scan Barcode -->
                                                <button type="button" class="btn btn-sm rounded position-relative"
                                                    data-bs-toggle="modal" data-bs-target="#modalScanBarcode">
                                                    <i class="fa-solid fa-qrcode fs-1"></i>
                                                </button>

                                                <!-- Modal search scan Barcodel -->
                                                <div class="modal fade" id="modalScanBarcode" tabindex="-1"
                                                    aria-labelledby="modalScanBarcodeLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">
                                                                    Search from barcode
                                                                </h5>
                                                                <button type="button" class="btn-close"
                                                                    data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body text-dark">
                                                                <div id="reader" width="600px"></div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary"
                                                                    data-bs-dismiss="modal">Close</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="input-group-append">
                                                <button type="submit" class="input-group-text bg-primary"><i
                                                        class="fa-solid fa-magnifying-glass font-size-20 text-white"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <hr>

                    <div class="col-lg-12">
                        <div class="table-responsive">
                            <table class="table table-striped align-middle">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">No.</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">@sortablelink('product_name', 'Product Name')</th>
                                        <th scope="col">@sortablelink('product_code', 'Product Code')</th>
                                        <th scope="col">@sortablelink('category.name', 'category')</th>
                                        <th scope="col">@sortablelink('stock')</th>
                                        <th scope="col">@sortablelink('category.satuan', 'satuan')</th>
                                        <th scope="col">@sortablelink('selling_price', 'Price')</th>
                                        <th scope="col">Status</th>
                                        <th scope="col"></th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($products as $product)
                                        <tr>
                                            <th scope="row">
                                                {{ $products->currentPage() * (request('row') ? request('row') : 10) - (request('row') ? request('row') : 10) + $loop->iteration }}
                                            </th>
                                            <td>
                                                <div style="max-height: 80px; max-width: 80px;">
                                                    <img class="img-fluid"
                                                        src="{{ $product->product_image ? asset('storage/products/' . $product->product_image) : asset('assets/img/products/default.webp') }}">
                                                </div>
                                            </td>
                                            <td>{{ $product->product_name }}</td>
                                            <td>{{ $product->product_code }}</td>
                                            <td>
                                                @if ($product->category_id != null)
                                                    {{ $product->category->name }}
                                                @else
                                                    Belum Ditentukan!
                                                @endif
                                            </td>
                                            <td>{{ $product->stock }}</td>
                                            <td>
                                                @if ($product->category_id != null)
                                                    {{ $product->category->satuan }}
                                                @else
                                                    Belum Ditentukan!
                                                @endif
                                            </td>
                                            <td>Rp. {{ number_format($product->selling_price) }}</td>
                                            <td>
                                                @if ($product->status_id == 1)
                                                    Aktif
                                                @else
                                                    Tidak Aktif
                                                @endif
                                            </td>
                                            <td>
                                                @if ($product->status_id == 1)
                                                    <form id="status-form-{{ $product->id }}"
                                                        action="{{ route('change-status-product', $product->id) }}"
                                                        method="POST">
                                                        @method('PUT')
                                                        @csrf
                                                        <div class="form-check form-switch">
                                                            <input class="form-check-input" name="status"
                                                                type="checkbox" role="switch"
                                                                id="flexSwitchCheckChecked-{{ $product->id }}" checked
                                                                onchange="submitForm({{ $product->id }})">
                                                        </div>
                                                    </form>
                                                @else
                                                    <form id="status-form-{{ $product->id }}"
                                                        action="{{ route('change-status-product', $product->id) }}"
                                                        method="POST">
                                                        @method('PUT')
                                                        @csrf
                                                        <div class="form-check form-switch">
                                                            <input class="form-check-input" name="status"
                                                                type="checkbox" role="switch"
                                                                id="flexSwitchCheckChecked-{{ $product->id }}"
                                                                onchange="submitForm({{ $product->id }})">
                                                        </div>
                                                    </form>
                                                @endif
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <a href="{{ route('products.show', $product->product_name) }}"
                                                        class="btn btn-outline-success btn-sm mx-1"><i
                                                            class="fa-solid fa-eye"></i></a>
                                                    <a href="{{ route('products.edit', $product->id) }}"
                                                        class="btn btn-outline-primary btn-sm mx-1"><i
                                                            class="fas fa-edit"></i></a>
                                                    <form action="{{ route('products.destroy', $product->id) }}"
                                                        method="POST">
                                                        @method('delete')
                                                        @csrf
                                                        <button type="submit" class="btn btn-outline-danger btn-sm"
                                                            onclick="return confirm('Are you sure you want to delete this record?')">
                                                            <i class="far fa-trash-alt"></i>
                                                        </button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>

                    {{ $products->links() }}
                </div>
            </div>
        </div>
    </div>
    <!-- END: Main Page Content -->
@endsection

@section('specificpagescripts')
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
        function submitForm(id) {
            document.getElementById('status-form-' + id).submit();
        }
    </script>

    <script src="https://unpkg.com/html5-qrcode" type="text/javascript"></script>
    <script>
        let html5QrcodeScanner;

        function onScanSuccess(decodedText, decodedResult) {
            console.log(`Code matched = ${decodedText}`, decodedResult);

            // Cek apakah hasil scan adalah URL
            try {
                const url = new URL(decodedText);
                window.location.href = url.href; // Mengarahkan ke URL
            } catch (e) {
                console.log(`Result is not a valid URL: ${decodedText}`);
            }

            // Hentikan scanner setelah mendapatkan hasil
            if (html5QrcodeScanner) {
                html5QrcodeScanner.clear().then(() => {
                    console.log("Scanner stopped.");
                }).catch(error => {
                    console.error("Failed to clear scanner. Error:", error);
                });
            }
        }

        function onScanFailure(error) {
            console.warn(`Code scan error = ${error}`);
        }

        document.getElementById('modalScanBarcode').addEventListener('show.bs.modal', function() {
            if (!html5QrcodeScanner) {
                html5QrcodeScanner = new Html5QrcodeScanner(
                    "reader", {
                        fps: 10,
                        qrbox: {
                            width: 250,
                            height: 250
                        }
                    },
                    false);
            }
            html5QrcodeScanner.render(onScanSuccess, onScanFailure);
        });

        document.getElementById('modalScanBarcode').addEventListener('hidden.bs.modal', function() {
            if (html5QrcodeScanner) {
                html5QrcodeScanner.clear().then(() => {
                    console.log("Scanner stopped.");
                }).catch(error => {
                    console.error("Failed to clear scanner. Error:", error);
                });
            }
        });
    </script>
@endsection
