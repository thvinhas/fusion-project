@extends('welcome')

@section('content')
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Weather</h1>
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

                <table class="table table-bordered" id="table">
                    <thead>
                        <tr>
                            <th>location</th>
                            <th>Date</th>
                            <th>Min Temp</th>
                            <th>Max Temp</th>
                            <th>wind Speed (day)</th>
                            <th>wind direction (day)</th>
                            <th>wind Speed (night)</th>
                            <th>wind direction (night)</th>
                            <th width="280px">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($weathers as $weather)
                        <tr>
                            <td>{{ $weather->Location->name }}</td>
                            <td>{{ $weather->date_check }}</td>
                            <td>{{ $weather->min_temp }}</td>
                            <td>{{ $weather->max_temp }}</td>
                            <td>{{ $weather->wind_speed }}</td>
                            <td>{{ $weather->wind_dir }}</td>
                            <td>{{ $weather->wind_speed_night }}</td>
                            <td>{{ $weather->wind_dir_night }}</td>
                            <td>
                                <form action="{{ route('weather.destroy',$weather->id) }}" method="POST">
                                    <input type="hidden" name="watherId" class="weatherId" value="{{$weather->id}}">
                                    <a type="button" class="btn btn-primary edit">Edit</a>

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

    <div class="row">
        <div>
            <div class="card mb-4">
                <div class="card-header">
                    Add weather
                </div>
                <div class="card-body">
                    <form action="" method="post" id="add_weather">
                        <div class="row">
                            <div class="col-md-2">
                                <label for="nome">Location:</label>
                                @csrf
                                <select class='form-control' name="location_id" id="location">
                                    @foreach ($locations as $location)
                                    <option value="{{$location->id}}">{{$location->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label for="nome">Location:</label>
                                <input type="date" class='form-control' name="date_check" id="date_check">
                            </div>
                            <div class="col-md-2">
                                <label for="nome">Min temp:</label>
                                <input type="number" min="1" class='form-control' name="min_temp" id="min_temp">
                            </div>
                            <div class="col-md-2">
                                <label for="nome">Max Temp:</label>
                                <input type="number" min="1" class='form-control' name="max_temp" id="max_temp">
                            </div>
                            <div class="col-md-2">
                                <label for="nome">Wind seed (day):</label>
                                <input type="number" min="1" class='form-control' name="wind_speed" id="wind_speed">
                            </div>
                            <div class="col-md-2">
                                <label for="nome">Wind direction (day):</label>
                                <select name="wind_dir" class='form-control' id="wind_dir">
                                    <option value="N">North</option>
                                    <option value="NE">northeast</option>
                                    <option value="E">East</option>
                                    <option value="SE">southeast</option>
                                    <option value="S">South</option>
                                    <option value="SW">southwest</option>
                                    <option value="W">West</option>
                                    <option value="NW">northwest</option>
                                </select>
                            </div>
                        </div>
                        <div class="row" >
                        <div class="col-md-6">
                            <label for="nome">Wind seed (night) :</label>
                            <input type="number" min="1" class='form-control' name="wind_speed_night"
                                id="wind_speed_night">
                        </div>
                        <div class="col-md-6">
                            <label for="nome">Wind direction (night):</label>
                            <select class='form-control' name="wind_dir_night" id="wind_dir_night">
                                <option value="N">North</option>
                                <option value="NE">northeast</option>
                                <option value="E">East</option>
                                <option value="SE">southeast</option>
                                <option value="S">South</option>
                                <option value="SW">southwest</option>
                                <option value="W">West</option>
                                <option value="NW">northwest</option>
                            </select>
                        </div>
                        </div>
                        <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 text-center ">
                            <button type="submit" class="btn btn-primary" id="submit">Submit</button>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        var url = '/weather/store';
    $('#add_weather').submit(function(event){
        event.preventDefault();
        var data = $(this).serializeArray();     
        // data.push({'_token': '{{ csrf_token() }}');
        $.ajax({
            url:  url,
           type: 'POST',
           data: {
               'form': JSON.stringify(data),
               '_token': '{{ csrf_token() }}'
           }
       })
       .done(function( returnedHtml ) {
           console.log(returnedHtml);
        var text = (returnedHtml.method == 'store') ? 'Weather created successfully.' : 'Weather updated successfully';
        swal(text,'','success').then(function () {
            location.reload();
        });
       })
    });

    $('.edit').click(function (e) { 
        e.preventDefault();
        var id = $(this).parent().find('.weatherId').val();
        $.ajax({
            type: "GET",
            url: "/weather/edit/" + id,
            dataType: "JSON",
            success: function (response) {
                url = '/weather/update/' + response.id;
                $('#date_check').val(response.date_check);
                $('#min_temp').val(response.min_temp);
                $('#max_temp').val(response.max_temp);
                $('#wind_speed').val(response.wind_speed);
                $('#wind_dir').val(response.wind_dir);
                $('#wind_speed_night').val(response.wind_speed_night);
                $('#wind_dir_night').val(response.wind_dir_night);
            }
        });

    });
    

    </script>
    @endsection