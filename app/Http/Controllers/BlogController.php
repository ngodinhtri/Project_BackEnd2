<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\DB;
use Session;
use App\Product;
use App\Manufacture;
use App\Protype;
use App\ShoppingCart;

class BlogController extends Controller
{
    //Trang chủ
    public function index($s = 'index')
    {
        if(View::exists($s) == false)
        {
            return view(404);
        }
        $top8 = Product::select('products.name','products.ID_product','products.img','products.unit_price','protypes.name_type')
        ->join('protypes','products.ID_type','=','protypes.ID_type')
        ->orderBy('ID_product','desc')->limit(8)->get();
        return view('index',compact('top8'));
    }

    //Trang chi tiết
    public function detail($id)
    {
        $item = Product::where('ID_product',$id)->first();
        $manu = Manufacture::where('ID_manu',$item->ID_manu)->first();
        $type = Protype::where('ID_type',$item->ID_type)->first();
        return view('single-product',compact('item','manu','type'));
    }

    //Trang cửa hàng
    public function shop()
    {
        $products = Product::select('products.name','products.ID_product','products.img','products.unit_price','protypes.name_type')
        ->join('protypes','products.ID_type','=','protypes.ID_type')
        ->orderBy('ID_product','desc')->paginate(9);

        $allproducts =  Product::get();
        $count = count($allproducts); //đếm tất cả sản phẩm
        $per_page = 9; // Số Sản Phẩm
        $total_page = ceil($count/$per_page);  // Tổng Pages

        return view('shop',compact('products','count','per_page','total_page'));
    }

    //Trang trả về kết quả tìm kiếm
    public function timkiem(Request $request)
    {
        $products = Product::where('name','like',"%".$request->key."%")->get(); //tất cả sản phẩm tìm kiếm được theo key

        $Top9 = Product::select('products.name','products.ID_product','products.img','products.unit_price','protypes.name_type')
        ->join('protypes','products.ID_type','=','protypes.ID_type')
        ->where('name','like',"%".$request->key."%")
        ->orderBy('ID_product','desc')->paginate(9);

        $count = count($products);
        $per_page = 9; // Số Sản Phẩm
        $total_page = ceil($count/$per_page);  // Tổng Pages
        
        return view('search',compact('products','count','Top9','per_page','total_page'));
    }

    //Trang phân loại
    public function phanloai($type_page)
    {
        $products_type = Product::join('protypes','products.ID_type','=','protypes.ID_type')
        ->where('protypes.name_type',$type_page)
        ->orderBy('ID_product','desc')->get();

        $count = count($products_type);
        $per_page = 9; // Số Sản Phẩm
        $total_page = ceil($count/$per_page);  // Tổng Pages

        $products_type = Product::select('products.name','products.ID_product','products.img','products.unit_price','protypes.name_type')
        ->join('protypes','products.ID_type','=','protypes.ID_type')
        ->where('protypes.name_type',$type_page)
        ->orderBy('ID_product','desc')->paginate(9);
        //dd( $products_type);
        return view('type',compact('products_type','count','type_page','per_page','total_page'));
    }

    //Thêm sản phẩm
    public function addToCart(Request $request, $id)
    {
        //trả về sản phẩm theo id
        $product = Product::where('ID_product',$id)->first();
        //Kiểm tra $product có tồn tại
        if($product!=null)
        {
            $oldcart = Session('cart')?Session::get('cart'):null; //trả về session('cart') hiện tại nếu có
            $cart = new ShoppingCart($oldcart); //tạo 1 shopping cart mới
            $cart->add($product,$id); //gọi method add() trong class Shopping cart
            $request->session()->put('cart',$cart); //thêm vào Session('cart') để cập nhật
            //dd($cart);
            return redirect()->back();// trả về trang trước
        }
    }
    
    //Buy Now
    public function buyNow(Request $request, $id)
    {
        //trả về sản phẩm theo id
        $product = Product::where('ID_product',$id)->first();
        //Kiểm tra $product có tồn tại
        if($product!=null)
        {
            $oldcart = Session('cart')?Session::get('cart'):null; //trả về session('cart') hiện tại nếu có
            $cart = new ShoppingCart($oldcart); //tạo 1 shopping cart mới
            $cart->add($product,$id); //gọi method add() trong class Shopping cart
            $request->session()->put('cart',$cart); //thêm vào Session('cart') để cập nhật
            //dd($cart);
            return redirect('cart');// trả về cart
        }
    }

    //Trang giỏ hàng
    public function cart()
    {
        return view('cart');
    }

    //Xoá 1 sản phẩm(tất cả số lượng)
    public function deleteItem(Request $request, $id)
    {
        $oldcart = Session('cart')?Session::get('cart'):null;
        $cart = new ShoppingCart($oldcart);
        if($cart->totalQuantity > 0) //kiểm tra số lượng phải lớn hơn 0
        {  
            if(!empty($cart->items[$id])) //kiểm tra sản phẩm $id có trong giỏ hàng?
            {
                $cart->removeItem($id); //gọi method xoá theo $id
                $request->session()->put('cart',$cart); //Session('cart') cập nhật
                
            }
        }
        return redirect('cart');// trả về cart
    }
}
