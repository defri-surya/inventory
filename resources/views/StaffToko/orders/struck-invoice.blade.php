<!DOCTYPE html>
<html lang="en">

<head>
    <title>Invoice</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">

    <!-- External CSS libraries -->
    <link type="text/css" rel="stylesheet" href="{{ asset('assets/invoice/css/bootstrap.min.css') }}">
</head>
<style type="text/css">
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 12px;
    }

    .text-right {
        text-align: right;
    }

    .text-left {
        text-align: left;
    }

    table {
        width: 100%;
        font-size: 12px;
        border: none;
    }

    @media print {
        @page {
            margin: 0;
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
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            {{-- info toko --}}
                            <address>
                                <strong style="font-size: 16px">{{ $tokoid->name }}</strong><br>
                                <span>
                                    {{ $tokoid->address }}
                                </span><br>
                                <span>{{ $tokoid->phone }}</span>
                            </address>
                        </div>
                        <hr style="border: 2px solid black;">
                        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                            <p>
                                <em>Tanggal:
                                    {{ Carbon\Carbon::parse($order->order_date)->format('d F Y') }}</em><br>
                                <em>No. Order: #{{ $order->invoice_no }}</em><br>
                                <em>Konsumen: {{ $customer->name }}</em>
                            </p>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="text-center">
                            <!-- <h1>Receipt</h1> -->
                        </div>
                        </span>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="text-left">Item</th>
                                    <th class="text-center">Price</th>
                                    <th class="text-right">Quantity</th>
                                    <th class="text-right">Discount</th>
                                    <th class="text-center">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($orderDetails as $item)
                                    <tr>
                                        <td class="text-left"><em>{{ $item->productToko->product_name }}</em></h4>
                                        </td>
                                        <td class="text-right">
                                            Rp. {{ number_format($item->productToko->selling_price, 0) }}</td>
                                        <td class="text-center">{{ $item->quantity }}</td>
                                        <td class="text-center">
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
                                <tr style="border-color: transparent">
                                    <td></td>
                                </tr>
                                <tr style="border-color: transparent">
                                    <td>  </td>
                                    <td class="text-right" colspan="3">
                                        <strong>Subtotal: </strong>
                                    </td>
                                    <td class="text-right">
                                        <strong>Rp. {{ number_format($order->sub_total, 0) }}</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>  </td>
                                    <td class="text-right" colspan="3">
                                        <strong>Total Pembelian: </strong>
                                    </td>
                                    <td class="text-right">
                                        <strong>Rp. {{ number_format($order->total, 0) }}</strong>
                                    </td>
                                </tr>
                                <tr style="border-color: transparent">
                                    <td>  </td>
                                    <!-- <td>   </td> -->
                                    <td class="text-right" colspan="3">
                                        <strong>Pembayaran:</strong>
                                    </td>
                                    <td class="text-right">
                                        <strong>Rp. {{ number_format($order->pay, 0) }}</strong>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </center>
</body>

</html>
