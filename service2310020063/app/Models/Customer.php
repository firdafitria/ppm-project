<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Customer extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    // 1. Tentukan nama tabelnya
    protected $table = 'customer';

    // 2. Tentukan Primary Key nya
    protected $primaryKey = 'id_customer';

    /**
     * Field yang boleh diisi (Mass Assignable)
     * Sesuaikan dengan kolom di tabel customer
     */
    protected $fillable = [
        'username',
        'nama',
        'email',
        'alamat',
        'image',
        'no_telp',
        'password',
    ];

    /**
     * Field yang disembunyikan saat data dikirim ke aplikasi mobile (JSON)
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Casting tipe data
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];
}