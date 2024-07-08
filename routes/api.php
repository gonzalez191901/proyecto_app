<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/login', [App\Http\Controllers\Auth\LoginController::class, 'attemptLogin']);
Route::post('/inicio', [App\Http\Controllers\HomeController::class, 'home']);
Route::post('/create_user', [App\Http\Controllers\Auth\RegisterController::class, 'createUser']);
Route::post('/create/publicacion', [App\Http\Controllers\PublicacionController::class, 'create']);
Route::post('/comentarios', [App\Http\Controllers\PublicacionController::class, 'comentarios']);
Route::post('/create/comentario', [App\Http\Controllers\PublicacionController::class, 'create_comentario']);
Route::post('/user/foto', [App\Http\Controllers\UserController::class, 'agregar_foto']);
Route::post('/user/profile', [App\Http\Controllers\UserController::class, 'perfil']);
Route::post('/create/descripcion', [App\Http\Controllers\UserController::class, 'descripcion']);
Route::post('/create/event', [App\Http\Controllers\EventosController::class, 'create']);
Route::post('/cantidad/eventos', [App\Http\Controllers\EventosController::class, 'cantidad_eventos']);
Route::post('/like_publicacion', [App\Http\Controllers\PublicacionController::class, 'like']);
Route::post('/user/mis_datos', [App\Http\Controllers\UserController::class, 'mis_datos']);
Route::post('/user/update', [App\Http\Controllers\UserController::class, 'update']);
Route::post('/publicacion/delete', [App\Http\Controllers\PublicacionController::class, 'delete']);
Route::post('/user/search', [App\Http\Controllers\UserController::class, 'search']);



