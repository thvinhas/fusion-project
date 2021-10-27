<?php

use App\Http\Controllers\LocationController;
use App\Http\Controllers\WeatherController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', function () {
    return view('location.index');
})->middleware(['auth']);

Route::get('/location', [LocationController::class, 'index'])->middleware(['auth'])->name('location.index');
Route::get('/location/create',  [LocationController::class, 'create'])->middleware(['auth'])->name('location.create');
Route::post('/location/store', [LocationController::class, 'store'])->middleware(['auth'])->name('location.store');
Route::get('/location/edit/{id}',  [LocationController::class, 'edit'])->middleware(['auth'])->name('location.edit');
Route::patch('/location/update/{id}',  [LocationController::class, 'update'])->middleware(['auth'])->name('location.update');
Route::delete('/location/destroy/{id}',  [LocationController::class, 'destroy'])->middleware(['auth'])->name('location.destroy');


Route::get('/weather', [WeatherController::class, 'index'])->middleware(['auth'])->name('weather.index');
Route::get('/weather/edit/{id}',  [WeatherController::class, 'edit'])->middleware(['auth'])->name('weather.edit');
Route::post('/weather/update/{id}',  [WeatherController::class, 'update'])->middleware(['auth'])->name('weather.update');
Route::delete('/weather/destroy/{id}',  [WeatherController::class, 'destroy'])->middleware(['auth'])->name('weather.destroy');
Route::post('/weather/store', [WeatherController::class, 'store'])->name('weather.store');


Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
