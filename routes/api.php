<?php

use Illuminate\Http\Request;

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

// 通用功能
Route::group(['prefix'=>'common','namespace'=>'Common'],function(){
    // 编辑器文件上传
    Route::get('ueditor_upload','UploaderController@getUeditorupload');
    Route::post('ueditor_upload','UploaderController@postUeditorupload');
    // 文件上传
    Route::post('upload','UploaderController@postUploadimg');
});