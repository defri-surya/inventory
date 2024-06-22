@extends('dashboard.body.main')

@section('specificpagescripts')
    <script src="{{ asset('assets/js/img-preview.js') }}"></script>
@endsection

@section('content')
    <!-- BEGIN: Header -->
    <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
        <div class="container-xl px-4">
            <div class="page-header-content pt-4">
                <div class="row align-items-center justify-content-between">
                    <div class="col-auto mt-4">
                        <h1 class="page-header-title">
                            <div class="page-header-icon"><i class="fa-solid fa-boxes-stacked"></i></div>
                            Tambah Produk
                        </h1>
                    </div>
                </div>

                <nav class="mt-4 rounded" aria-label="breadcrumb">
                    <ol class="breadcrumb px-3 py-2 rounded mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="{{ route('products.index') }}">Produks</a></li>
                        <li class="breadcrumb-item active">Create</li>
                    </ol>
                </nav>
            </div>
        </div>
    </header>
    <!-- END: Header -->

    <!-- BEGIN: Main Page Content -->
    <div class="container-xl px-2 mt-n10">
        <form action="{{ route('products.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="row">
                <div class="col-xl-4">
                    <!-- Produk image card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Produk Image</div>
                        <div class="card-body text-center">
                            <!-- Produk image -->
                            <img class="img-account-profile mb-2" src="{{ asset('assets/img/products/default.webp') }}"
                                alt="" id="image-preview" />
                            <!-- Produk image help block -->
                            <div class="small font-italic text-muted mb-2">JPG or PNG no larger than 2 MB</div>
                            <!-- Produk image input -->
                            <input class="form-control form-control-solid mb-2 @error('product_image') is-invalid @enderror"
                                type="file" id="image" name="product_image" accept="image/*"
                                onchange="previewImage();">
                            @error('product_image')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                    </div>
                </div>

                <div class="col-xl-8">
                    <!-- BEGIN: Produk Details -->
                    <div class="card mb-4">
                        <div class="card-header">
                            Produk Details
                        </div>
                        <div class="card-body">
                            <!-- Form Group (product name) -->
                            <div class="mb-3">
                                <label class="small mb-1" for="product_name">Nama Produk <span
                                        class="text-danger">*</span></label>
                                <input class="form-control form-control-solid @error('product_name') is-invalid @enderror"
                                    id="product_name" name="product_name" type="text" placeholder=""
                                    value="{{ old('product_name') }}" autocomplete="off" />
                                @error('product_name')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <!-- Form Group (product code) -->
                            <div class="mb-3">
                                <label class="small mb-1" for="product_code">Kode Produk <span
                                        class="text-danger">*</span></label>
                                <input class="form-control form-control-solid @error('product_code') is-invalid @enderror"
                                    id="product_code" name="product_code" type="text" placeholder=""
                                    value="{{ old('product_code') }}" autocomplete="off" />
                                @error('product_code')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>

                            <!-- Form Row -->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (stock) -->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="stock">Stock <span
                                            class="text-danger">*</span></label>
                                    <input class="form-control form-control-solid @error('stock') is-invalid @enderror"
                                        id="stock" name="stock" type="text" placeholder=""
                                        value="{{ old('stock') }}" autocomplete="off" />
                                    @error('stock')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <!-- Form Group (min stock) -->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="stock">Minimal Stok<span
                                            class="text-danger">*</span></label>
                                    <input class="form-control form-control-solid @error('min_stock') is-invalid @enderror"
                                        id="min_stock" name="min_stock" type="text" placeholder=""
                                        value="{{ old('min_stock') }}" autocomplete="off" />
                                    @error('min_stock')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            <!-- Form Row -->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (category product) -->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="category_id">Kategori Produk <span
                                            class="text-danger">*</span></label>
                                    <select
                                        class="form-select form-control-solid @error('category_id') is-invalid @enderror"
                                        id="category_id" name="category_id">
                                        <option selected="" disabled="">Pilih Kategori:</option>
                                        @foreach ($categories as $category)
                                            <option value="{{ $category->id }}"
                                                @if (old('category_id') == $category->id) selected="selected" @endif>
                                                {{ $category->name }} - {{ $category->satuan }}</option>
                                        @endforeach
                                    </select>
                                    @error('category_id')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <!-- Form Group (type of product grades) -->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="grades_id">Grades <span
                                            class="text-danger">*</span></label>
                                    <select class="form-select form-control-solid" id="grades_id" name="grade_id">
                                        @if ($grades->first()->detailValues->isNotEmpty())
                                            @foreach ($grades->first()->detailValues as $detail)
                                                <option value="{{ $detail->id }}">{{ $detail->name }}</option>
                                            @endforeach
                                        @else
                                            <option value="" disabled>Tidak Ditemukan Grade</option>
                                        @endif
                                    </select>
                                </div>
                            </div>

                            <!-- Form Row -->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (type of supplier) -->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="supplier_id">Supplier <span
                                            class="text-danger">*</span></label>
                                    <select class="form-select form-control-solid" id="supplier_id" name="supplier_id">
                                        @if ($supplier->isNotEmpty())
                                            @foreach ($supplier as $detail)
                                                <option value="{{ $detail->id }}">{{ $detail->name }}</option>
                                            @endforeach
                                        @else
                                            <option value="" disabled>Tidak Ditemukan Merek</option>
                                        @endif
                                    </select>
                                </div>
                                <!-- Form Group (type of product mades) -->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="mades_id">Made In <span
                                            class="text-danger">*</span></label>
                                    <select class="form-select form-control-solid" id="mades_id" name="made_in_id">
                                        @if ($mades->first()->detailValues->isNotEmpty())
                                            @foreach ($mades->first()->detailValues as $detail)
                                                <option value="{{ $detail->id }}">{{ $detail->name }}</option>
                                            @endforeach
                                        @else
                                            <option value="" disabled>Tidak Ditemukan Grade</option>
                                        @endif
                                    </select>
                                </div>
                            </div>
                            <!-- Form Row -->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (type of product item type) -->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="buying_price">Harga Beli <span
                                            class="text-danger">*</span></label>
                                    <input
                                        class="form-control form-control-solid @error('buying_price') is-invalid @enderror"
                                        id="buying_price" name="buying_price" type="text" placeholder=""
                                        value="{{ old('buying_price') }}" autocomplete="off" />
                                    @error('buying_price')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <!-- Form Group (type of product mades) -->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="selling_price">Harga Jual <span
                                            class="text-danger">*</span></label>
                                    <input
                                        class="form-control form-control-solid @error('selling_price') is-invalid @enderror"
                                        id="selling_price" name="selling_price" type="text" placeholder=""
                                        value="{{ old('selling_price') }}" autocomplete="off" />
                                    @error('selling_price')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            <!-- Form Row -->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (type of discount percent) -->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="discount_percent">Discount Percent</label>
                                    <input
                                        class="form-control form-control-solid @error('discount_percent') is-invalid @enderror"
                                        id="discount_percent" name="discount_percent" type="text" placeholder=""
                                        value="{{ old('discount_percent') }}" autocomplete="off" />
                                    @error('discount_percent')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <!-- Form Group (type of discount price) -->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="discount_price">Discount Rupiah</label>
                                    <input
                                        class="form-control form-control-solid @error('discount_price') is-invalid @enderror"
                                        id="discount_price" name="discount_price" type="text" placeholder=""
                                        value="{{ old('discount_price') }}" autocomplete="off" />
                                    @error('discount_price')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>

                            <!-- Form Group (weight) -->
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="small mb-1" for="weight">Berat <span
                                            class="text-danger">*</span></label>
                                    <input class="form-control form-control-solid @error('weight') is-invalid @enderror"
                                        id="weight" name="weight" type="text" placeholder=""
                                        value="{{ old('weight') }}" autocomplete="off" />
                                    @error('weight')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            <!-- Form Group (product detail) -->
                            <div class="mb-3">
                                <label for="detail">Product Detail <span class="text-danger">*</span></label>
                                <textarea class="form-control form-control-solid @error('detail') is-invalid @enderror" id="detail"
                                    name="detail" rows="3">{{ old('detail') }}</textarea>
                                @error('detail')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>

                            <!-- Submit button -->
                            <button class="btn btn-primary" type="submit">Simpan</button>
                            <a class="btn btn-danger" href="{{ route('products.index') }}">Cancel</a>
                        </div>
                    </div>
                    <!-- END: Produk Details -->
                </div>
            </div>
        </form>
    </div>
    <!-- END: Main Page Content -->
@endsection

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

<script type="text/javascript">
    {{--  brands  --}}
    $(document).ready(function() {
        @if ($brands->first()->detailValues->isNotEmpty())
            var detailName = @json($brands->first()->detailValues->first()->name);
            var detailId = @json($brands->first()->detailValues->first()->id);
            $('#brands_id').select2({
                placeholder: "Pilih Merek Produk",
                allowClear: true,
                data: [{
                    id: detailId,
                    text: detailName
                }]
            });
        @else
            $('#brands_id').select2();
        @endif
    });

    {{--  grades  --}}
    $(document).ready(function() {
        @if ($grades->first()->detailValues->isNotEmpty())
            var detailName = @json($grades->first()->detailValues->first()->name);
            var detailId = @json($grades->first()->detailValues->first()->id);
            $('#grades_id').select2({
                placeholder: "Pilih Grade Produk",
                allowClear: true,
                data: [{
                    id: detailId,
                    text: detailName
                }]
            });
        @else
            $('#grades_id').select2();
        @endif
    });

    {{--  groups  --}}
    $(document).ready(function() {
        @if ($groups->first()->detailValues->isNotEmpty())
            var detailName = @json($groups->first()->detailValues->first()->name);
            var detailId = @json($groups->first()->detailValues->first()->id);
            $('#groups_id').select2({
                placeholder: "Pilih Merek Produk",
                allowClear: true,
                data: [{
                    id: detailId,
                    text: detailName
                }]
            });
        @else
            $('#groups_id').select2();
        @endif
    });

    {{--  types  --}}
    $(document).ready(function() {
        @if ($types->first()->detailValues->isNotEmpty())
            var detailName = @json($types->first()->detailValues->first()->name);
            var detailId = @json($types->first()->detailValues->first()->id);
            $('#types_id').select2({
                placeholder: "Pilih Grade Produk",
                allowClear: true,
                data: [{
                    id: detailId,
                    text: detailName
                }]
            });
        @else
            $('#types_id').select2();
        @endif
    });

    {{--  item type  --}}
    $(document).ready(function() {
        @if ($item_types->first()->detailValues->isNotEmpty())
            var detailName = @json($item_types->first()->detailValues->first()->name);
            var detailId = @json($item_types->first()->detailValues->first()->id);
            $('#item_types_id').select2({
                placeholder: "Pilih Merek Produk",
                allowClear: true,
                data: [{
                    id: detailId,
                    text: detailName
                }]
            });
        @else
            $('#item_types_id').select2();
        @endif
    });

    {{--  made in  --}}
    $(document).ready(function() {
        @if ($mades->first()->detailValues->isNotEmpty())
            var detailName = @json($mades->first()->detailValues->first()->name);
            var detailId = @json($mades->first()->detailValues->first()->id);
            $('#mades_id').select2({
                placeholder: "Pilih Grade Produk",
                allowClear: true,
                data: [{
                    id: detailId,
                    text: detailName
                }]
            });
        @else
            $('#mades_id').select2();
        @endif
    });
</script>
