<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class weather extends Model
{
    public $timestamps = false;
    protected $table = "weather";
    protected $fillable = ['location_id', 'day_num', 'date_check', 'min_temp', 'max_temp', 'weather', 'weather_night', 'weather_text', 'weather_textN', 'wind_speed', 'wind_dir', 'wind_speed_night', 'wind_dir_night'];

    public function location()
    {
        return $this->belongsTo(Location::class, 'location_id', 'id');
    }
}
