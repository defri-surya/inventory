@extends('dashboard.body.main')

@section('content')
    <!-- BEGIN: Header -->
    <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
        <div class="container-xl px-4">
            <div class="page-header-content pt-4">
                <div class="row align-items-center justify-content-between">
                    <div class="col-auto mt-4">
                        <h1 class="page-header-title">
                            <div class="page-header-icon"><i class="fa-solid fa-users"></i></div>
                            List Data Toko
                        </h1>
                    </div>
                    <div class="col-auto my-4">
                        <a href="{{ route('createToko') }}" class="btn btn-primary add-list"><i
                                class="fa-solid fa-plus me-3"></i>Add</a>
                        <a href="{{ route('list-toko.index') }}" class="btn btn-danger add-list"><i
                                class="fa-solid fa-trash me-3"></i>Clear Search</a>
                    </div>
                </div>

                <nav class="mt-4 rounded" aria-label="breadcrumb">
                    <ol class="breadcrumb px-3 py-2 rounded mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                        <li class="breadcrumb-item active">List Data Toko</li>
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
                        <form action="{{ route('list-toko.index') }}" method="GET">
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
                                                placeholder="Search supplier" value="{{ request('search') }}">
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
                            <table class="table table-striped">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">No.</th>
                                        <th scope="col">@sortablelink('name')</th>
                                        <th scope="col">@sortablelink('email')</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Status</th>
                                        <th scope="col"></th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse ($toko as $tokos)
                                        <tr>
                                            <th scope="row">
                                                {{ $toko->currentPage() * (request('row') ? request('row') : 10) - (request('row') ? request('row') : 10) + $loop->iteration }}
                                            </th>
                                            <td>{{ $tokos->name }}</td>
                                            <td>{{ $tokos->email }}</td>
                                            <td>{{ $tokos->phone }}</td>
                                            <td>
                                                @if ($tokos->status_id == 1)
                                                    Aktif
                                                @else
                                                    Tidak Aktif
                                                @endif
                                            </td>
                                            <td>
                                                @if ($tokos->status_id == 1)
                                                    <form id="status-form-{{ $tokos->id }}"
                                                        action="{{ route('change-status-toko', $tokos->id) }}"
                                                        method="POST">
                                                        @method('PUT')
                                                        @csrf
                                                        <div class="form-check form-switch">
                                                            <input class="form-check-input" name="status" type="checkbox"
                                                                role="switch"
                                                                id="flexSwitchCheckChecked-{{ $tokos->id }}" checked
                                                                onchange="submitForm({{ $tokos->id }})">
                                                        </div>
                                                    </form>
                                                @else
                                                    <form id="status-form-{{ $tokos->id }}"
                                                        action="{{ route('change-status-toko', $tokos->id) }}"
                                                        method="POST">
                                                        @method('PUT')
                                                        @csrf
                                                        <div class="form-check form-switch">
                                                            <input class="form-check-input" name="status" type="checkbox"
                                                                role="switch"
                                                                id="flexSwitchCheckChecked-{{ $tokos->id }}"
                                                                onchange="submitForm({{ $tokos->id }})">
                                                        </div>
                                                    </form>
                                                @endif
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <a href="{{ route('list-toko.edit', $tokos->id) }}"
                                                        class="btn btn-outline-primary btn-sm mx-1"><i
                                                            class="fas fa-edit"></i></a>
                                                    <form action="{{ route('list-toko.destroy', $tokos->id) }}"
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
                                    @empty
                                        <tr>
                                            <th scope="row" colspan="5" class="text-center">
                                                Belum ada data !
                                            </th>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>

                    {{ $toko->links() }}
                </div>
            </div>
        </div>
    </div>
    <!-- END: Main Page Content -->
@endsection

@section('specificpagescripts')
    <script>
        function submitForm(id) {
            document.getElementById('status-form-' + id).submit();
        }
    </script>
@endsection
