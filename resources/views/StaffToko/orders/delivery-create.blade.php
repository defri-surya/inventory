@extends('dashboard.body.main')

@section('specificpagescripts')
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    {{-- error ajax kalo gk ada jquery --}}
    <script src="{{ asset('assets/js/modalDO.js') }}"></script>
@endsection

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
                            Delivery create
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

            <!-- BEGIN: Information Customer -->
            <div class="col-xl-12">
                <div class="card mb-4">
                    <div class="card-header">
                        Delivery Create
                    </div>
                    <div class="card-body">
                        <!-- Your form goes here -->
                        <form action="{{ route('delivery-orderToko.store') }}" method="POST">
                            @csrf

                            <div class="mb-3">
                                <label hidden for="id_customer" class="form-label">Buyer ID</label>
                                <input hidden type="number" class="form-control" id="id_customer" name="id_customer"
                                    value="{{ $order->customer->id }}" required>
                            </div>

                            <div class="mb-3">
                                <label hidden for="id_order" class="form-label">Order Detail ID</label>
                                <input hidden type="number" class="form-control" id="id_order" name="id_order"
                                    value="{{ $order->id }}" required>
                            </div>

                            <div class="mb-3">
                                <label for="invoice_description" class="form-label">Invoice
                                    Description</label>
                                <textarea class="form-control" id="invoice_description" name="invoice_description" rows="3" required></textarea>
                            </div>

                            <div class="mb-3">
                                <label for="ship_via" class="form-label">Ship Via</label>
                                <input type="text" class="form-control" id="ship_via" name="ship_via" required>
                            </div>

                            <div class="mb-3">
                                <label for="delivery_date" class="form-label">Delivery Date</label>
                                <input type="date" class="form-control" id="delivery_date" name="delivery_date" required>
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                        <!-- END: Table Product -->
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
