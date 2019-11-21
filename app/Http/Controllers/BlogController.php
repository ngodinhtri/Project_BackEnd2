<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\DB;
use App\Product;
use App\Manufacture;
use App\Protype;

class BlogController extends Controller
{
    public function index($s = 'index')
    {
        if(View::exists($s) == false)
        {
            return view(404);
        }
        $top8 = Product::orderBy('ID_product','desc')->limit(8)->get();
        return view('index',compact('top8'));
    }

    public function detail($id)
    {
        $item = Product::where('ID_product',$id)->first();
        $manu = Manufacture::where('ID_manu',$item->ID_manu)->first();
        return view('single-product',compact('item','manu'));
    }

    public function shop()
    {
        $products = Product::orderBy('ID_product','desc')->paginate(9);
        $allproducts =  Product::get();
        $count = count($allproducts);
        return view('shop',compact('products','count'));
    }

    public function timkiem(Request $request)
    {
        $products = Product::where('name','like',"%".$request->key."%")->get(); //tất cả sản phẩm tìm kiếm được theo key
        $Top9 = Product::where('name','like',"%".$request->key."%")->orderBy('ID_product','desc')->paginate(9);
        $count = count($products);
        return view('search',compact('products','count','Top9'));
    }

    public function phanloai($type_page)
    {
        $products_type = DB::table('products')->join('protypes',function($join){
            $join->on('products.ID_type','=','protypes.ID_type');
        })->where('protypes.name_type',$type_page) ->orderBy('ID_product','desc')->get();

        $count = count($products_type);

        $products_type = DB::table('products')->join('protypes',function($join){
            $join->on('products.ID_type','=','protypes.ID_type');
        })->where('protypes.name_type',$type_page) ->orderBy('ID_product','desc')->paginate(9);
        //dd( $products_type);
        return view('type',compact('products_type','count','type_page'));
    }
}
