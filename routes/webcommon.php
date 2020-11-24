<?php

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

// Home PC版
Route::group(['namespace' => 'Home'],function(){
    // 首页
    Route::get('/','HomeController@getIndex');
    Route::get('/cate/{url}','HomeController@getCate');
    Route::get('/post/{url}','HomeController@getPost');
});
