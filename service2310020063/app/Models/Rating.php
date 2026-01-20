<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rating extends Model
{
    use HasFactory;

    // 1. Tentukan nama tabel sesuai ERD
    protected $table = 'rating';

    // 2. Tentukan Primary Key-nya
    protected $primaryKey = 'id';

    public $timestamps = false;

    /**
     * Field yang boleh diisi (Mass Assignable)
     * Sesuaikan dengan kolom di tabel rating
     */
    protected $fillable = [
        'id_tukang',
        'id_pesanan',
        'id_customer',
        'rating',
        'ulasan',
    ];

    /**
     * Relasi ke tabel Customer
     * Satu rating dimiliki oleh satu customer
     */
    public function customer()
    {
        return $this->belongsTo(User::class, 'id_customer', 'id_customer');
    }

}