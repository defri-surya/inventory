<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class shoppingcart extends Model
{
    use HasFactory;

    protected $table = 'shoppingcart';
    protected $guarded = ['id'];

    public function product()
    {
        return $this->belongsTo(ProductToko::class, 'product_id');
    }
}
