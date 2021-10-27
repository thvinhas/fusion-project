@extends('welcome')

@section('content')
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Location</h1>
</div>

@if ($errors->any())
<div class="alert alert-danger">
    <strong>Whoops!</strong> There were some problems with your input.<br><br>
    <ul>
        @foreach ($errors->all() as $error)
        <li>{{ $error }}</li>
        @endforeach
    </ul>
</div>
@endif
<div class="row">
    <div>
        <div class="card mb-4">
            <div class="card-header">
                Add new Location
            </div>
            <div class="card-body">
                <form action="{{ route('location.store') }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <strong>Name:</strong>
                                <input type="text" name="name" class="form-control" placeholder="Name">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    <div class="form-group">
                    <div class="text-right">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div></div></div>
                </form>
            </div>
        </div>
    </div>
    @endsection