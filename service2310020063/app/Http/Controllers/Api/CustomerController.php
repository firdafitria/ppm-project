<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB; 
use Illuminate\Http\Request;

class CustomerController extends Controller
{
    // Menampilkan semua customer
    public function index() {
        $customers = DB::table('customer')->get();
        return response()->json(['status' => 'success', 'data' => $customers], 200);
    }

    // Menampilkan satu customer (Sudah ada)
    public function show($id) {
        $customer = DB::table('customer')->where('id_customer', $id)->first();
        if ($customer) {
            return response()->json(['status' => 'success', 'data' => $customer], 200);
        }
        return response()->json(['message' => 'Customer tidak ditemukan'], 404);
    }

    // Mengubah data customer
    public function update(Request $request, $id) {
        $input = $request->all();
        DB::table('customer')->where('id_customer', $id)->update([
            'nama'  => $input['nama'],
            'email' => $input['email'],
        ]);
        return response()->json(['status' => 'success', 'message' => 'Data diperbarui'], 200);
    }

    // Menghapus customer
    public function destroy($id) {
        DB::table('customer')->where('id_customer', $id)->delete();
        return response()->json(['status' => 'success', 'message' => 'Data dihapus'], 200);
    }
}