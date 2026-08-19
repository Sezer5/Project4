<?php

use App\Http\Controllers\Api\ProductController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


Route::get('/products', [ProductController::class, 'index']);
Route::get('/products/{color}/color', [ProductController::class, 'getProductsByColor']);
Route::get('/products/{size}/size', [ProductController::class, 'getProductsBySize']);
Route::get('/products/{term}/term', [ProductController::class, 'getProductsByTerm']);
Route::get('/products/{product}/product', [ProductController::class, 'getProduct']);
