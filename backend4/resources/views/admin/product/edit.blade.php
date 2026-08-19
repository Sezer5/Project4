    @extends('layouts.adminlayout')
    @section('title')
        Edit
    @endsection
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 mb-4">
                        <div class="card p-3">
                            <div class="col-md-4">
                                <form action="{{ route('admin.product.update', $product->slug) }}" method="POST"
                                    enctype="multipart/form-data">
                                    @csrf
                                    @method('PUT')
                                    <div class="mb-3">
                                        <label for="" class="form-label">Name</label>
                                        <input type="text" class="form-control @error('name') is-invalid @enderror"
                                            name="name" placeholder="Please enter name*" value="{{ $product->name }}" />
                                        @error('name')
                                            <span class="invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">Quantity</label>
                                        <input type="number" class="form-control @error('quantity') is-invalid @enderror"
                                            name="quantity" placeholder="Please enter quantity*"
                                            value="{{ $product->quantity }}" />
                                        @error('quantity')
                                            <span class="invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">Price</label>
                                        <input type="text" class="form-control @error('price') is-invalid @enderror"
                                            name="price" placeholder="Please enter price*"
                                            value="{{ $product->price }}" />
                                        @error('price')
                                            <span class="invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">Status</label>
                                        <select class="form-select form-select-sm" name="status">
                                            <option value="1" selected>In Stock</option>
                                            <option value="0">Out Stock</option>
                                        </select>
                                        @error('status')
                                            <span class="invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">Colors</label>
                                        <select multiple class="form-select form-select-sm" name="color_id[]">
                                            @foreach ($colors as $color)
                                                <option value="{{ $color->id }}"
                                                    @if ($product->colors->contains($color->id)) selected @endif>{{ $color->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">Sizes</label>
                                        <select multiple class="form-select form-select-sm" name="size_id[]">
                                            @foreach ($sizes as $size)
                                                <option value="{{ $size->id }}"
                                                    @if ($product->sizes->contains($size->id)) selected @endif>{{ $size->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">Thumbnail</label>
                                        <input type="file" class="form-control @error('thumbnail') is-invalid @enderror"
                                            name="thumbnail" placeholder="Please enter thumbnail*" />
                                        @error('thumbnail')
                                            <span class="invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>

                                    <div class="mb-3">
                                        <label for="" class="form-label">Description</label>
                                        <textarea class="form-control" name="description" id="" rows="3">{{ $product->description }}</textarea>
                                        @error('description')
                                            <span class="invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="mb-3 text-end">
                                        <button class="btn btn-sm btn-success">
                                            Submit
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    @endsection
