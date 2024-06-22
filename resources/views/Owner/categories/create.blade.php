@extends('dashboard.body.main')

@section('content')
    <!-- BEGIN: Header -->
    <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
        <div class="container-xl px-4">
            <div class="page-header-content pt-4">
                <div class="row align-items-center justify-content-between">
                    <div class="col-auto mt-4">
                        <h1 class="page-header-title">
                            <div class="page-header-icon"><i class="fa-solid fa-folder"></i></div>
                            Tambah Kategori
                        </h1>
                    </div>
                </div>

                <nav class="mt-4 rounded" aria-label="breadcrumb">
                    <ol class="breadcrumb px-3 py-2 rounded mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="{{ route('categories.index') }}">Categories</a></li>
                        <li class="breadcrumb-item active">Create</li>
                    </ol>
                </nav>
            </div>
        </div>
    </header>
    <!-- END: Header -->

    <!-- BEGIN: Main Page Content -->
    <div class="container-xl px-2 mt-n10">
        <form action="{{ route('categories.store') }}" method="POST">
            @csrf
            <div class="row">

                <div class="col-xl-12">
                    <!-- BEGIN: Kategori Details -->
                    <div class="card mb-4">
                        <div class="card-header">
                            Kategori Details
                        </div>
                        <div class="card-body">
                            <!-- Form Group (name) -->
                            <div class="mb-3">
                                <label class="small mb-1" for="name">Nama Kategori <span
                                        class="text-danger">*</span></label>
                                <input class="form-control form-control-solid @error('name') is-invalid @enderror"
                                    id="name" name="name" type="text" placeholder="" value="{{ old('name') }}"
                                    autocomplete="off" />
                                @error('name')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <!-- Form Group (satuan) -->
                            <div class="mb-3">
                                <label class="small mb-1" for="satuan">Satuan <span class="text-danger">*</span>
                                </label>
                                <input class="form-control form-control-solid @error('satuan') is-invalid @enderror"
                                    id="satuan" name="satuan" type="text" placeholder=""
                                    value="{{ old('satuan') }}" />
                                @error('satuan')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>

                            <!-- Submit button -->
                            <button class="btn btn-primary" type="submit">Add</button>
                            <a class="btn btn-danger" href="{{ route('categories.index') }}">Cancel</a>
                        </div>
                    </div>
                    <!-- END: Kategori Details -->
                </div>
            </div>
        </form>
    </div>
    <!-- END: Main Page Content -->

    <script>
        // Slug Generator
        const title = document.querySelector("#name");
        const slug = document.querySelector("#slug");
        title.addEventListener("keyup", function() {
            let preslug = title.value;
            preslug = preslug.replace(/ /g, "-");
            slug.value = preslug.toLowerCase();
        });
    </script>
@endsection
