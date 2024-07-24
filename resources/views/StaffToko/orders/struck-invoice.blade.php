<!DOCTYPE html>
<html lang="en">

<head>
    <title>Invoice</title>
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
            margin: 4%;
        }
    }
</style>

<!------ Include the above in your HEAD tag ---------->

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
                                <em>Tanggal:
                                    {{ Carbon\Carbon::parse($order->order_date)->format('d F Y') }}</em><br>
                                <em>No. Order: #{{ $order->invoice_no }}</em><br>
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
                                    <th>Discount</th>
                                    <th class="text-right">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($orderDetails as $item)
                                    <tr>
                                        <td class="text-left"><em>{{ $item->productToko->product_name }}</em></h4>
                                        </td>
                                        <td class="text-right" style="text-align: right">
                                            Rp. {{ number_format($item->productToko->selling_price, 0) }}</td>
                                        <td class="text-right">{{ $item->quantity }}</td>
                                        <td class="text-right">
                                            @if ($item->productToko->discount_percent != null)
                                                {{ $item->productToko->discount_percent }} %
                                            @elseif ($item->productToko->discount_price != null)
                                                Rp. {{ number_format($item->productToko->discount_price, 0) }}
                                            @else
                                                0
                                            @endif
                                        </td>
                                        <td class="text-right" style="text-align: right">
                                            Rp. {{ number_format($item->total, 0) }}</td>
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
                                    <td class="text-right" colspan="3">
                                        <p>
                                            <strong>Sub Total: </strong>
                                        </p>
                                    </td>
                                    <td class="text-right">
                                        <p class="text-right">
                                            <strong>Rp. {{ number_format($order->sub_total, 0) }}</strong>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>  </td>
                                    <td class="text-right" colspan="3">
                                        <p>
                                            <strong>Tax: </strong>
                                        </p>
                                    </td>
                                    <td class="text-right">
                                        <p class="text-right">
                                            <strong>Rp. {{ number_format($order->vat, 0) }}</strong>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>  </td>
                                    <td class="text-right" colspan="3">
                                        <p>
                                            <strong>Total Pembelian: </strong>
                                        </p>
                                    </td>
                                    <td class="text-right">
                                        <p class="text-right">
                                            <strong>Rp. {{ number_format($order->total, 0) }}</strong>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>  </td>
                                    <!-- <td>   </td> -->
                                    <td class="text-right" colspan="3">
                                        <p>
                                            <strong>Pembayaran:</strong>
                                        </p>

                                    </td>
                                    <td class="text-left">
                                        <p class="text-right">
                                            <strong>Rp. {{ number_format($order->pay, 0) }}</strong>
                                        </p>
                                    </td>
                                </tr>
                                {{-- <tr>
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
    </center>
</body>

</html>
