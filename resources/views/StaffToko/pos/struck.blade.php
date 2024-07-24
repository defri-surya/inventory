<!DOCTYPE html>
<html lang="en">

<head>
    <title>Inventory</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">

    <!-- External CSS libraries -->
    <link type="text/css" rel="stylesheet" href="{{ asset('assets/invoice/css/bootstrap.min.css') }}">

    <!-- Google fonts -->
    {{-- <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
        rel="stylesheet"> --}}

    <!-- Custom Stylesheet -->
    <link type="text/css" rel="stylesheet" href="{{ asset('assets/invoice/css/style.css') }}">
</head>
<style type="text/css">
    body {
        /*margin-top: 20px;*/
        font-size: 11px;
    }

    .text-right {
        text-align: right;
    }

    .text-left {
        text-align: left;
    }

    table {
        width: 100%;
        font-size: 11px;
    }

    @media print {

        @page {
            /*size: 5in 8.5in;*/
        }

    }
</style>

<body>
    <!------ Include the above in your HEAD tag ---------->

    @if (Request::segment(1) == 'cetak')

        <body onload=\"window.print()\">
            <script type="text/javascript">
                setTimeout(function() {
                    window.print();
                }, 500);
                window.onfocus = function() {
                    setTimeout(function() {
                        window.close();
                    }, 500);
                }
            </script>
    @endif
    <center class="mt-5">
        <div class="container">
            <div class="row">
                <div>
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            {{-- info toko --}}
                            <address>
                                {{--                                <strong>{{ $order->customer->name }}</strong> --}}
                                {{--                                <br> --}}
                                {{--                               	{{ $order->customer->address }} --}}
                                {{--                                <br> --}}
                                <strong style="font-size: 16px">{{ $tokoid->name }}</strong><br>
                                <span>
                                    {{ $tokoid->address }}
                                </span><br>
                                <span>{{ $tokoid->phone }}</span>
                                <!-- <abbr title="Phone">P:</abbr> (213) 484-6829 -->
                            </address>
                        </div>
                        {{-- <div class="col-xs-6 col-sm-6 col-md-6 text-center">
                            <p>
                                <em>Tanggal: {{ $order->order_date }}</em><br>
                                <em>No. Order: #{{ $order->order_date }}</em><br>
                                @if ($order->customer->name != null)
                                    <em>Konsumen:{{ $order->customer->name}}</em>
                                @endif
                            </p>
                        </div> --}}
                        {{-- info customer --}}
                        <div class="col-xs-6 col-sm-6 col-md-6 text-center">
                            <p>
                                <em>Tanggal: {{ Carbon\Carbon::now()->format('d F Y') }}</em><br>
                                {{-- <em>No. Order: #{{ $order->order_date }}</em><br> --}}
                                <em>Konsumen: {{ $customer->name }}</em>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="text-center">
                            <!-- <h1>Receipt</h1> -->
                        </div>
                        </span>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="text-left">Item</th>
                                    <th class="text-right">Price</th>
                                    <th>Quantity</th>
                                    <th class="text-right">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($carts as $item)
                                    <tr>
                                        <td class="text-left"><em>{{ $item->name }}</em></h4>
                                        </td>
                                        <td class="text-right" style="text-align: right">
                                            Rp. {{ number_format($item->price, 0) }}</td>
                                        <td class="text-right">{{ $item->qty }}</td>
                                        <td class="text-right" style="text-align: right">
                                            Rp. {{ number_format($item->subtotal, 0) }}</td>
                                    </tr>
                                @endforeach
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                {{-- <tr>
                                    <td>  </td>
                                    <td class="text-left" colspan="2">
                                        <p>
                                            <strong>Total Jml: </strong>
                                        </p>
                                    </td>
                                    <td class="text-left">
                                        <p class="text-right">
                                            <strong>{{ $order->total_products }}</strong>
                                        </p>
                                    </td>
                                </tr> --}}
                                <tr>
                                    <td>  </td>
                                    <td class="text-right" colspan="2">
                                        <p>
                                            <strong>Sub Total: </strong>
                                        </p>
                                    </td>
                                    <td class="text-right">
                                        <p class="text-right">
                                            <strong>Rp. {{ Cart::subtotal() }}</strong>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>  </td>
                                    <td class="text-right" colspan="2">
                                        <p>
                                            <strong>Tax: </strong>
                                        </p>
                                    </td>
                                    <td class="text-right">
                                        <p class="text-right">
                                            <strong>Rp. {{ Cart::tax() }}</strong>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>  </td>
                                    <td class="text-right" colspan="2">
                                        <p>
                                            <strong>Total Pembelian: </strong>
                                        </p>
                                    </td>
                                    <td class="text-right">
                                        <p class="text-right">
                                            <strong>Rp. {{ Cart::total() }}</strong>
                                        </p>
                                    </td>
                                </tr>
                                {{-- <tr>
                                    <td>  </td>
                                    <!-- <td>   </td> -->
                                    <td class="text-left" colspan="2">
                                        <p>
                                            Pembayaran:
                                        </p>

                                    </td>
                                    <td class="text-left">
                                        <p class="text-right">
                                            Rp. {{ number_format($order->pay, 0) }}
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>  </td>
                                    <td class="text-left" colspan="2">
                                        <p>
                                            Uang Kembalian:
                                        </p>

                                    </td>
                                    <td class="text-left">
                                        <p class="text-right">
                                            Rp. {{ number_format($order->due, 0) }}
                                        </p>
                                    </td>
                                </tr> --}}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="invoice-btn-section clearfix d-print-none mt-5">
            <a class="btn btn-lg btn-primary" href="{{ route('posToko.index') }}">
                Back
            </a>
            <button class="btn btn-lg btn-download" type="button" data-bs-toggle="modal" data-bs-target="#modal">
                Pay Now
            </button>
        </div>
    </center>

    <!-- BEGIN: Modal -->
    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title text-center mx-auto" id="modalCenterTitle">Invoice of
                        {{ $customer->name }}<br />Total Amount Rp {{ Cart::total() }}</h3>
                </div>

                <form action="{{ route('posToko.createOrder') }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="modal-body">
                            <input type="hidden" name="customer_id" value="{{ $customer->id }}">
                            <input type="hidden" name="agen_id" value="{{ $sales->id }}">
                            <div class="mb-3">
                                <!-- Form Group (type of product category) -->
                                <label class="small mb-1" for="payment_type">Payment <span
                                        class="text-danger">*</span></label>
                                <select class="form-control @error('payment_type') is-invalid @enderror"
                                    id="payment_type" name="payment_type">
                                    <option selected="" disabled="">Select a payment:</option>
                                    <option value="HandCash">HandCash</option>
                                    <option value="Cheque">Cheque</option>
                                    <option value="Due">Due</option>
                                </select>
                                @error('payment_type')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="mb-3">
                                <label class="small mb-1" for="pay">Pay Now <span
                                        class="text-danger">*</span></label>
                                <input type="text"
                                    class="form-control form-control-solid @error('pay') is-invalid @enderror"
                                    id="pay" name="pay" placeholder="" value="{{ old('pay') }}"
                                    autocomplete="off" />
                                @error('pay')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button class="btn btn-lg btn-danger" type="button" data-bs-dismiss="modal">Cancel</button>
                        <button class="btn btn-lg btn-download" type="submit">Pay</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- END: Modal -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous">
    </script>
</body>

</html>
