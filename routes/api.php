<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PageController;

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

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });


Route::post('/register', [AuthController::class, 'register']);    
Route::post('/login', [AuthController::class, 'login']);

Route::group(['middleware' => ['jwt.auth']], function($router) {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/refresh', [AuthController::class, 'refresh']);
    Route::get('/user-profile', [AuthController::class, 'userProfile']);

    Route::post('/create-page', [PageController::class, 'createPage']);    
    Route::post('/follow-person', [UserController::class, 'followUser']);    
    Route::post('/follow-page', [PageController::class, 'followPage']);    
    Route::post('/add-personal-post', [UserController::class, 'addPost']);    
    Route::post('/publish-page-post', [PageController::class, 'publishPost']);    
    Route::get('/view-newsfeed', [UserController::class, 'showNewsfeed']);
});