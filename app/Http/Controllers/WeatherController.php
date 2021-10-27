<?php

namespace App\Http\Controllers;

use App\Models\Location;
use App\Models\weather;
use Illuminate\Http\Request;
use PhpParser\JsonDecoder;

class WeatherController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $weathers = Weather::all();
        $locations = Location::all();
        return view('weather.index',compact('weathers','locations'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input = $request->all()['form'];
        $input = json_decode($input);

        $data = array();
        $data['location_id'] = $input[1]->value;
        
        $data['date_check'] = date("Y-m-d", strtotime($input[2]->value));
        $data['min_temp'] = $input[3]->value;
        $data['max_temp'] = $input[4]->value;
        $data['wind_speed'] = $input[5]->value;
        $data['wind_dir'] = $input[6]->value;
        $data['wind_speed_night'] = $input[7]->value;
        $data['wind_dir_night'] = $input[8]->value;

        weather::create($data);


        // Location::create($request->all());
    
        return json_encode(['method'=>'store']);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\weather  $weather
     * @return \Illuminate\Http\Response
     */
    public function show(weather $weather)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\weather  $weather
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request, $id)
    {
        $weather = weather::findOrFail($id);
        return json_encode($weather);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\weather  $weather
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $input = $request->all()['form'];
        $input = json_decode($input);
        $data = array();
        $data['location_id'] = $input[1]->value;
        
        $data['date_check'] = date("Y-m-d", strtotime($input[2]->value));
        $data['min_temp'] = $input[3]->value;
        $data['max_temp'] = $input[4]->value;
        $data['wind_speed'] = $input[5]->value;
        $data['wind_dir'] = $input[6]->value;
        $data['wind_speed_night'] = $input[7]->value;
        $data['wind_dir_night'] = $input[8]->value;
        $weather = weather::whereId($id)->first();
        $weather->update($data);
        return json_encode(['method'=>'update']);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\weather  $weather
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        $location= weather::findOrFail($id);
        $location->delete();

        return redirect()->route('weather.index')
                        ->with('success','weather updated successfully');
    }
}
