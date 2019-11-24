<?php
namespace App;

class ShoppingCart{
    public $items = null;
    public $totalQuantity = 0;
    public $totalPrice = 0;

    //constructor nếu có oldCart
    public function __construct($oldCart){
        if($oldCart)        
        {
            $this->items = $oldCart->items;
            $this->totalQuantity = $oldCart->totalQuantity;
            $this->totalPrice = $oldCart->totalPrice;
        }
    }

    public function add($item,$id) //add 1 sản phẩm
    {
        $sanpham_cart = ['qty'=> 0,'price' => $item->unit_price,'item' => $item]; //tạo 1 mảng cho 1 sản phẩm trong giỏ hàng(items)

        if($this->items) //kiểm tra giỏ hàng khác null
        {
            if(array_key_exists($id,$this->items)) //kiểm tra sản phẩm đã tồn tại trong items chưa
            {
                $sanpham_cart = $this->items[$id]; //lấy dữ liệu có sẳn đã tồn tại trong items bỏ vào $sanpham
            }
        }

        $sanpham_cart['qty']++; //tăng sản số lượng sản phẩm 
        $sanpham_cart['price'] = $sanpham_cart['qty'] * $item->unit_price; //cập nhật tổng giá theo số lượng
        $this->items[$id] = $sanpham_cart;
        $this->totalQuantity++; //cập nhật số sản phẩm trong giỏ hàng
        $this->totalPrice += $item->unit_price;
    }

    //Xoá nhiều số lượng cùng 1 sản phẩm
    public function removeItem($id)
    {
        $this->totalQuantity -= $this->items[$id]['qty'];
        $this->totalPrice -= $this->items[$id]['price'];
        unset($this->items[$id]);
    }
}