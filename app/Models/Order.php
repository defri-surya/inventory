<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Kyslik\ColumnSortable\Sortable;

class Order extends Model
{
    use HasFactory, Sortable;

    protected $fillable = [
        'customer_id',
        'order_date',
        'order_status',
        'total_products',
        'sub_total',
        'vat',
        'total',
        'invoice_no',
        'payment_type',
        'pay',
        'due',
        'bagian',
        'toko_id',
        'gudang_id',
    ];

    public $sortable = [
        'customer_id',
        'order_date',
        'pay',
        'due',
        'total',
    ];

    protected $guarded = [
        'id',
    ];

    protected $with = [
        'customer',
    ];

    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer_id', 'id');
    }

    public function toko()
    {
        return $this->belongsTo(ListToko::class, 'customer_id', 'id');
    }

    public function listtoko()
    {
        return $this->belongsTo(ListToko::class, 'customer_id', 'id');
    }

    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? false, function ($query, $search) {
            return $query->where('invoice_no', 'like', '%' . $search . '%');
        });
    }
}
