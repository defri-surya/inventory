<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Kyslik\ColumnSortable\Sortable;

class Purchase extends Model
{
    use HasFactory, Sortable;

    protected $fillable = [
        'supplier_id',
        'purchase_date',
        'purchase_due_date',
        'purchase_no',
        'purchase_status',
        'total_amount',
        'total_amount_paid',
        'created_by',
        'updated_by',
        'arrival_date',
        'bagian',
        'toko_id',
        'gudang_id',
        'no_faktur_pajak_pembelian',
    ];

    public $sortable = [
        'purchase_date',
        'total_amount',
    ];
    protected $guarded = [
        'id',
    ];

    protected $with = [
        'supplier',
        'user_created',
        'user_updated',
    ];

    public function supplier()
    {
        return $this->belongsTo(Supplier::class, 'supplier_id', 'id');
    }

    public function gudang()
    {
        return $this->belongsTo(Gudang::class, 'gudang_id', 'id');
    }

    public function toko()
    {
        return $this->belongsTo(ListToko::class, 'toko_id', 'id');
    }

    public function user_created()
    {
        return $this->belongsTo(User::class, 'created_by', 'id');
    }

    public function user_updated()
    {
        return $this->belongsTo(User::class, 'updated_by', 'id');
    }

    // Accessor to calculate the "amount_paid" attribute
    public function getPaidAttribute()
    {
        return $this->total_amount - $this->total_amount_paid;
    }

    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? false, function ($query, $search) {
            return $query->where('purchase_no', 'like', '%' . $search . '%')->orWhere('shopname', 'like', '%' . $search . '%');
        });
    }
}
