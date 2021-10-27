@extends('welcome')

@section('content')
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Location</h1>
    <a href="{{ route('location.create') }}" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm"><i
            class="fas fa-download fa-sm text-white-50"></i> Create location</a>
</div>

@if ($message = Session::get('success'))
<div class="alert alert-success">
    <p>{{ $message }}</p>
</div>
@endif
<div class="row">
    <div>
        <div class="card mb-4">
            <div class="card-header">
                List
            </div>
            <div class="card-body">
                <table class="table table-bordered cell-border" id="table">

                    <thead>
                        <tr>
                            <th>Name</th>
                            <th width="280px">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($locations as $location)
                        <tr>
                            <td>{{ $location->name }}</td>
                            <td>
                                <form action="{{ route('location.destroy',$location->id) }}" method="POST">

                                    <a class="btn btn-primary"
                                        href="{{ route('location.edit',$location->id) }}">Edit</a>

                                    @csrf
                                    @method('DELETE')

                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    @endsection