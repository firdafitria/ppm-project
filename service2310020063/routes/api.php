<?php

use App\Http\Controllers\Api\CustomerController;
use App\Http\Controllers\Api\RatingController;
use Illuminate\Support\Facades\Route;

// Gunakan singular 'customer' dan 'rating' (tanpa huruf S)
Route::get('/customer/{id}', [CustomerController::class, 'show']);
Route::post('/rating', [RatingController::class, 'store']);