<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Product;

class Product extends Model
{
    protected $table = 'products';

    public function protype()
    {
        return $this->belongsTo('App\Protype','ID_type','ID_product');
    }

    public function manufacture()
    {
        return $this->belongsTo('App\Manufacture','ID_manu','ID_product');
    }
}
