<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Manufacture extends Model
{
    protected $table = 'manufactures';

    public function product()
    {
        return $this->hasMany('App\Product','ID_type','ID_type');
    }
}
