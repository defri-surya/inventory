@extends('dashboard.body.main')

@section('specificpagescripts')
    <script src="{{ asset('assets/js/img-preview.js') }}"></script>
@endsection

@section('content')
    <!-- BEGIN: Header -->
    <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
        <div class="container-xl px-4">
            <div class="page-header-content">
                <div class="row align-items-center justify-content-between pt-3">
                    <div class="col-auto mb-3">
                        <h1 class="page-header-title">
                            <div class="page-header-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                    stroke-linecap="round" stroke-linejoin="round" class="feather feather-file">
                                    <path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
                                    <polyline points="13 2 13 9 20 9"></polyline>
                                </svg></div>
                            Point of Sale
                        </h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- END: Header -->

    <!-- BEGIN: Alert -->
    <div class="container-xl px-4">
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

    <!-- BEGIN: Main Page Content -->
    <div class="container-xl px-4">
        <div class="row">

            <!-- BEGIN: Section Left -->
            <div class="col-xl-12">
                <!-- BEGIN: Cart -->
                <div class="card mb-4">
                    <div class="card-header">
                        Cart
                    </div>
                    <div class="card-body">
                        <!-- BEGIN: Table Cart -->
                        <div class="table-responsive">
                            <table class="table table-striped align-middle">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">Name</th>
                                        <th scope="col">QTY</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">SubTotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($orderDetails as $order)
                                        <tr>
                                            <td>{{ $order->product->product_name }}</td>
                                            <td style="min-width: 170px;">
                                                {{ $order->quantity }}
                                            </td>
                                            <td>{{ $order->unitcost }}</td>
                                            <td>{{ $order->quantity * $order->unitcost }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                        <!-- END: Table Cart -->

                        <form action="{{ route('processOrder.createInvoice') }}" method="POST">
                            @csrf
                            <input type="hidden" name="order_id" value="{{ $orders->id }}">
                            <!-- Form Row -->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (total product) -->
                                <div class="col-md-6">
                                    <label class="small mb-1">Total Product</label>
                                    <input type="text" class="form-control form-control-solid fw-bold text-red"
                                        name="total_product" value="{{ $count }}" readonly>
                                    {{-- <div class="form-control form-control-solid fw-bold text-red">{{ $count }}</div> --}}
                                </div>
                                <!-- Form Group (subtotal) -->
                                {{-- <div class="col-md-6">
                                    <label class="small mb-1">Discount</label>
                                    <input type="text" class="form-control form-control-solid fw-bold text-red"
                                        id="discount" value="0">
                                </div> --}}
                                <div class="col-md-6">
                                    <label class="small mb-1">PPN 12%</label>
                                    <input type="text" class="form-control form-control-solid fw-bold text-red"
                                        name="tax" value="{{ $ppnCount }}" readonly>
                                </div>
                            </div>
                            <!-- Form Row -->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (tax) -->
                                <div class="col-md-6">
                                    <label class="small mb-1">Uang Muka</label>
                                    @if ($orders->total_amount_paid >= $orders->total_amount)
                                        <input type="text" class="form-control form-control-solid fw-bold text-red"
                                            value="Sudah Lunas" readonly>
                                    @else
                                        <input type="text" class="form-control form-control-solid fw-bold text-red"
                                            value="{{ $orders->total_amount_paid }}" readonly>
                                    @endif
                                </div>
                                <!-- Form Group (total) -->
                                <div class="col-md-6">
                                    <label class="small mb-1">Total</label>
                                    <input type="text" class="form-control form-control-solid fw-bold text-red"
                                        name="subtotal" value="{{ $ppnResult }}" readonly>
                                </div>
                            </div>
                            <!-- Form Group (customer) -->

                            <div class="row mb-3">
                                <div class="col-md-12 mb-3">
                                    <label class="small mb-1" for="customer_id">Customer <span
                                            class="text-danger">*</span></label>
                                    <input
                                        class="form-control form-control-solid @error('customer_id') is-invalid @enderror"
                                        id="customer_id" name="customer_id" type="hidden" value="{{ $toko->id }}"
                                        readonly>
                                    <input
                                        class="form-control form-control-solid @error('customer_id') is-invalid @enderror"
                                        type="text" value="{{ $toko->name }}" readonly>
                                    @error('customer_id')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <div class="col-md-12">
                                    <label class="small mb-1" for="agen_id">Sales Marketing <span
                                            class="text-danger">*</span></label>
                                    <select class="form-select form-control-solid @error('agen_id') is-invalid @enderror"
                                        id="agen_id" name="agen_id">
                                        <option selected="" disabled="">Select a Sales:</option>
                                        @foreach ($sales as $marketing)
                                            <option value="{{ $marketing->id }}"
                                                @if (old('agen_id') == $marketing->id) selected="selected" @endif>
                                                {{ $marketing->agen_name }}</option>
                                        @endforeach
                                    </select>
                                    @error('customer_id')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <!-- Submit button -->
                                <div class="col-md-12 mt-4">
                                    <div class="d-flex flex-wrap align-items-center justify-content-center">
                                        {{-- <a href="{{ route('customers.create') }}" class="btn btn-primary add-list mx-1">Add
                                            Customer</a> --}}
                                        <button type="submit" class="btn btn-success add-list mx-1">Create
                                            Invoice</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- END: Cart -->
            </div>
            <!-- END: Section Left -->
        </div>
    </div>
@endsection
