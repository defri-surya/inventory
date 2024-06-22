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
                            <div class="page-header-icon"><i class="fa-solid fa-users"></i></div>
                            Add Data Gudang
                        </h1>
                    </div>
                </div>

                <nav class="mt-4 rounded" aria-label="breadcrumb">
                    <ol class="breadcrumb px-3 py-2 rounded mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="{{ route('list-gudang.index') }}">List Data Gudang</a></li>
                        <li class="breadcrumb-item active">Create</li>
                    </ol>
                </nav>
            </div>
        </div>
    </header>
    <!-- END: Header -->

    <!-- BEGIN: Main Page Content -->
    <div class="container-xl px-2 mt-n10">
        <form action="{{ route('list-gudang.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="row">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Profile Picture</div>
                        <div class="card-body text-center">
                            <!-- Profile picture image -->
                            <img class="img-account-profile rounded-circle mb-2"
                                src="{{ asset('assets/img/demo/user-placeholder.svg') }}" alt=""
                                id="image-preview" />
                            <!-- Profile picture help block -->
                            <div class="small font-italic text-muted mb-2">JPG or PNG no larger than 1 MB</div>
                            <!-- Profile picture input -->
                            <input class="form-control form-control-solid mb-2 @error('photo') is-invalid @enderror"
                                type="file" id="image" name="photo" accept="image/*" onchange="previewImage();">
                            @error('photo')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                    </div>
                </div>

                <div class="col-xl-8">
                    <!-- BEGIN: Data Gudang Details -->
                    <div class="card mb-4">
                        <div class="card-header">
                            Data Gudang Details
                        </div>
                        <div class="card-body">
                            <!-- Form Group (name) -->
                            <div class="mb-3">
                                <label class="small mb-1" for="name">Name <span class="text-danger">*</span></label>
                                <input class="form-control form-control-solid @error('name') is-invalid @enderror"
                                    id="name" name="name" type="text" placeholder=""
                                    value="{{ old('name') }}" />
                                @error('name')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <!-- Form Group (email) -->
                            <div class="mb-3">
                                <label class="small mb-1" for="email">Email <span class="text-danger">*</span></label>
                                <input class="form-control form-control-solid @error('email') is-invalid @enderror"
                                    id="email" name="email" type="text" placeholder=""
                                    value="{{ old('email') }}" />
                                @error('email')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <!-- Form Group (NPWP) -->
                            <div class="mb-3">
                                <label class="small mb-1" for="npwp">NPWP<span class="text-danger">*</span></label>
                                <input class="form-control form-control-solid @error('npwp') is-invalid @enderror"
                                    id="npwp" name="npwp" type="text" placeholder=""
                                    value="{{ old('npwp') }}" />
                                @error('npwp')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <!-- Form Group (phone number) -->
                            <div class="mb-3">
                                <label class="small mb-1" for="phone">Phone number <span
                                        class="text-danger">*</span></label>
                                <input class="form-control form-control-solid @error('phone') is-invalid @enderror"
                                    id="phone" name="phone" type="text" placeholder=""
                                    value="{{ old('phone') }}" />
                                @error('phone')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <!-- Form Group (address) -->
                            <div class="mb-3">
                                <label for="address">Address <span class="text-danger">*</span></label>
                                <textarea class="form-control form-control-solid @error('address') is-invalid @enderror" id="address" name="address"
                                    rows="3">{{ old('address') }}</textarea>
                                @error('address')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>

                            <!-- Submit button -->
                            <button class="btn btn-primary" type="submit">Save</button>
                            <a class="btn btn-danger" href="{{ route('list-gudang.index') }}">Cancel</a>
                        </div>
                    </div>
                    <!-- END: Supplier Details -->
                </div>
            </div>
        </form>
    </div>
    <!-- END: Main Page Content -->
@endsection
