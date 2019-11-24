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


Route::get('detail/{id}',[
    'as'=>'thong-tin-san-pham',
    'uses'=>'BlogController@detail'
]);

Route::get('shop',    [
    'as'=>'cua-hang',
    'uses'=>'BlogController@shop'
]);

Route::get('search',[
    'as'=>'tim-kiem',
    'uses'=>'BlogController@timkiem'
]);

Route::get('type/{type_page}',[
    'as'=>'san-pham-theo-loai',
    'uses'=>'BlogController@phanloai'
]);


Route::get('addToCart/{id}','BlogController@addToCart');

Route::get('cart','BlogController@cart');

Route::get('buyNow/{id}','BlogController@buyNow');

Route::get('delItem/{id}','BlogController@deleteItem');

//bẫy 404 trang về index
Route::get('/{s?}',[
    'as'=>'trang-chu',
    'uses'=>'BlogController@index'
]);



