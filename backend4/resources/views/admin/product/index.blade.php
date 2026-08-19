    @extends('layouts.adminlayout')
    @section('title')
        product
    @endsection
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 mb-4">
                        <div class="card p-3">
                            <div class="col-md-4">
                                <a href="{{ route('admin.product.create') }}">
                                    <button class="btn btn-sm btn-success mb-3">
                                        <i class="bi bi-plus"></i> Add
                                    </button>
                                </a>
                                <table class="table table-responsive table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Slug</th>
                                            <th>Image</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($products as $product)
                                            <tr>
                                                <td>{{ $product->id }}</td>
                                                <td>{{ $product->name }}</td>
                                                <td>{{ $product->slug }}</td>
                                                <td><img src="{{ asset($product->thumbnail) }}" width="60"></td>
                                                <td>
                                                    <a href="{{ route('admin.product.edit', $product->slug) }}"
                                                        class="btn btn-sm btn-warning">
                                                        <i class="bi bi-pencil"></i>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="#" onclick="deleteItem({{ $product->id }})"
                                                        class="btn btn-danger btn-sm">
                                                        <i class="bi bi-trash"></i>
                                                    </a>
                                                    <form id="{{ $product->id }}"
                                                        action="{{ route('admin.product.destroy', $product->slug) }}"
                                                        method="post">
                                                        @csrf
                                                        @method('DELETE')
                                                    </form>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    @endsection
