<!DOCTYPE html>
<html lang="en">

<head>
    <title>Inventory</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">

    <!-- External CSS libraries -->
    <link type="text/css" rel="stylesheet" href="{{ asset('assets/invoice/css/bootstrap.min.css') }}">
    <link type="text/css" rel="stylesheet"
        href="{{ asset('assets/invoice/fonts/font-awesome/css/font-awesome.min.css') }}">

    <!-- Google fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">

    <!-- Custom Stylesheet -->
    <link type="text/css" rel="stylesheet" href="{{ asset('assets/invoice/css/style.css') }}">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
</head>

<body>


    <style>
        body {
            margin-top: 20px;
            background: #ffffff;
        }

        /*Invoice*/
        .invoice .top-left {
            font-size: 65px;
            color: #3ba0ff;
        }

        .invoice .top-right {
            text-align: right;
            padding-right: 20px;
        }

        .invoice .table-row {
            margin-left: -15px;
            margin-right: -15px;
            margin-top: 25px;
        }

        .invoice .payment-info {
            font-weight: 500;
        }

        .invoice .table-row .table>thead {
            border-top: 1px solid #ddd;
        }

        .invoice .table-row .table>thead>tr>th {
            border-bottom: none;
        }

        .invoice .table>tbody>tr>td {
            padding: 8px 20px;
        }

        .invoice .invoice-total {
            margin-right: -10px;
            font-size: 16px;
        }

        .invoice .last-row {
            border-bottom: 1px solid #ddd;
        }

        .invoice-ribbon {
            width: 85px;
            height: 88px;
            overflow: hidden;
            position: absolute;
            top: -1px;
            right: 14px;
        }

        .ribbon-inner {
            text-align: center;
            -webkit-transform: rotate(45deg);
            -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            -o-transform: rotate(45deg);
            position: relative;
            padding: 7px 0;
            left: -5px;
            top: 11px;
            width: 120px;
            background-color: #66c591;
            font-size: 15px;
            color: #fff;
        }

        .ribbon-inner:before,
        .ribbon-inner:after {
            content: "";
            position: absolute;
        }

        .ribbon-inner:before {
            left: 0;
        }

        .ribbon-inner:after {
            right: 0;
        }

        @media(max-width:575px) {

            .invoice .top-left,
            .invoice .top-right,
            .invoice .payment-details {
                text-align: center;
            }

            .invoice .from,
            .invoice .to,
            .invoice .payment-details {
                float: none;
                width: 100%;
                text-align: center;
                margin-bottom: 25px;
            }

            .invoice p.lead,
            .invoice .from p.lead,
            .invoice .to p.lead,
            .invoice .payment-details p.lead {
                font-size: 22px;
            }

            .invoice .btn {
                margin-top: 10px;
            }
        }

        @media print {
            .invoice {
                width: 650px;
                height: 500px;
            }
        }
    </style>
    <!-- BEGIN: Invoice -->
    <div class="container bootstrap snippets bootdeys">
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-default invoice" id="invoice_wrapper">
                    <div class="panel-body">
                        <div class="invoice-ribbon">
                            <div class="ribbon-inner clearfix d-print-none">Terbayar</div>
                        </div>
                        <div class="row">

                            <div class="col-sm-6 top-left">
                                <i class="fa fa-rocket"></i>
                            </div>

                            <div class="col-sm-6 top-right">
                                <h3 class="marginright">{{ $purchase->purchase_no }}</h3>
                                <span class="marginright">{{ $purchase->updated_at->format('l, F j Y') }}</span>
                            </div>

                        </div>
                        <hr>
                        <div class="row col-12">

                            <div class="col-4 from">
                                <p class="lead marginbottom">From : {{ $toko->name }}</p>
                                <p>Alamat: {{ $toko->address }}</p>
                                <p>Phone: {{ $toko->phone }}</p>
                            </div>

                            <div class="col-4 to">
                                <p class="lead marginbottom">To : {{ $purchase->gudang->name }}</p>
                                <p>Alamat: {{ $purchase->gudang->address }}</p>
                                <p>Phone: {{ $purchase->gudang->phone }}</p>

                            </div>

                            <div class="col-4 payment-details" style="text-align: right;">
                                <p class="lead marginbottom payment-info">Payment details</p>
                                <h6>Transaction Date:</h6>
                                <p>{{ date('l, d F Y', strtotime($purchase->purchase_date)) }}</p>
                                <h6>Transaction Due Date:</h6>
                                <p>{{ date('l, d F Y', strtotime($purchase->purchase_due_date)) }}</p>
                                <h6>No Faktur Pajak:</h6>
                                <p>{{ $purchase->no_faktur_pajak_pembelian }}</p>
                            </div>


                        </div>

                        <div class="row table-row">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th style="text-align: center; width:5%">#</th>
                                        <th style="text-align: center; width: 15%">Item</th>
                                        <th style="text-align: center; width: 15%">Jumlah</th>
                                        <th style="text-align: center; width: 15%">Harga Per Unit</th>
                                        <th style="text-align: center; width: 15%">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($purchaseDetails as $key => $item)
                                        <tr>
                                            <td style="text-align: center; width:5%">{{ $key + 1 }}</td>
                                            <td style="text-align: start; width: 15%">
                                                {{ $item->productToko->product_name }}
                                            </td>
                                            <td style="text-align: center; width: 15%">{{ $item->quantity }}</td>
                                            <td style="text-align: center; width: 15%">
                                                Rp. {{ number_format($item->unitcost, 0, ',', '.') }}
                                            </td>
                                            <td style="text-align: center; width: 15%">
                                                Rp. {{ number_format($item->total, 0, ',', '.') }}
                                            </td>
                                        </tr>
                                    @endforeach
                                    <tr>
                                        <td colspan="4">Subtotal</td>
                                        <td style="text-align: center; width: 15%">
                                            Rp. {{ number_format($purchase->total_amount, 0, ',', '.') }}
                                        </td>
                                    </tr>
                                    @if ($purchase->paid != 0)
                                        <tr>
                                            <td colspan="4">Uang Muka</td>
                                            <td style="text-align: center; width: 15%">
                                                Rp. {{ number_format($purchase->total_amount_paid, 0, ',', '.') }}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">Total Kekurangan</td>
                                            <td style="text-align: center; width: 15%">
                                                Rp. {{ number_format($purchase->paid, 0, ',', '.') }}
                                            </td>
                                        </tr>
                                    @endif
                                    {{--                            <tr class="last-row"> --}}
                                    {{--                                <td class="text-center">4</td> --}}
                                    {{--                                <td>Server Deployment</td> --}}
                                    {{--                                <td class="text-right">1</td> --}}
                                    {{--                                <td class="text-right">$300</td> --}}
                                    {{--                                <td class="text-right">$300</td> --}}
                                    {{--                            </tr> --}}
                                </tbody>
                            </table>

                        </div>

                        <div class="row">
                            <div class="col-xs-6 margintop">
                                <p class="lead marginbottom">TERIMA KASIH!</p>

                                {{--                            <button class="btn btn-success" id="invoice-print" onclick="window.location='{{ route('purchases.invoiceBillPdf', $purchase->id) }}'"> --}}
                                {{--                                <i class="fa fa-print"></i> Print Invoice --}}
                                {{--                            </button> --}}

                                <div class="invoice-btn-section clearfix d-print-none mb-5">
                                    <a href="javascript:window.print()" class="btn btn-lg btn-print">
                                        <i class="fa fa-print"></i> Print Invoice
                                    </a>
                                    <a id="invoice_download_btn" class="btn btn-lg btn-download">
                                        <i class="fa fa-download"></i> Download Invoice
                                    </a>
                                </div>


                                {{--                            <button class="btn btn-danger"><i class="fa fa-envelope-o"></i> Mail Invoice</button> --}}
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END: Invoice -->



    <script src="{{ asset('assets/invoice/js/jquery.min.js') }}"></script>
    <script src="{{ asset('assets/invoice/js/jspdf.min.js') }}"></script>
    <script src="{{ asset('assets/invoice/js/html2canvas.js') }}"></script>
    <script src="{{ asset('assets/invoice/js/app.js') }}"></script>

</body>

</html>
