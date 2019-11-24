<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Protype;
use App\Manufacture;
use Session;
use App\ShoppingCart;   

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //chuyển dữ liệu manufactures sang master để in ảnh trong footer
        view()->composer('layout.master',function($view){
            $manu = Manufacture::all();
            $view->with('manu',$manu);
        });

        //Chuyển dữ liệu shop cart 
        view()->composer('layout.master',function($view){
            if(Session('cart'))
            {
                $oldcart =  Session::get('cart');
                $cart = new ShoppingCart($oldcart);
                $view->with(['cart'=>Session::get('cart'),
                'product_cart'=>$cart->items, //danh sách các sản phẩm
                'totalPrice'=>$cart->totalPrice,
                'totalQuantity'=>$cart->totalQuantity]);
            }
        });

        //Chuyển dữ liệu shop cart 
        view()->composer('cart',function($view){
            if(Session('cart'))
            {
                $oldcart =  Session::get('cart');
                $cart = new ShoppingCart($oldcart);
                $view->with(['cart'=>Session::get('cart'),
                'product_cart'=>$cart->items, //danh sách các sản phẩm
                'totalPrice'=>$cart->totalPrice,
                'totalQuantity'=>$cart->totalQuantity]);
            }
        });
    }
}
