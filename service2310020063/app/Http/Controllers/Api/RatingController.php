<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RatingController extends Controller
{
    // READ: Menampilkan semua rating
    public function index()
    {
        $ratings = DB::table('rating')->get();
        return response()->json([
            'status' => 'success',
            'data' => $ratings
        ], 200);
    }

    // CREATE: Menyimpan rating
    public function store(Request $request)
{
    try {
        DB::table('rating')->insert([
            'id_tukang'   => $request->id_tukang,
            'id_pesanan'  => $request->id_pesanan,
            'id_customer' => $request->id_customer, // Gunakan langsung dari request
            'rating'      => $request->rating,
            'ulasan'      => $request->ulasan,
        ]);
        return response()->json(['status' => 'success'], 201);
    } catch (\Exception $e) {
        return response()->json(['status' => 'error', 'message' => $e->getMessage()], 500);
    }
}

    // UPDATE: Mengubah ulasan/rating
    public function update(Request $request, $id)
    {
        $input = $request->all();
        DB::table('rating')->where('id_rating', $id)->update([
            'rating' => $input['rating'],
            'ulasan' => $input['ulasan'],
        ]);
        return response()->json(['status' => 'success', 'message' => 'Rating diperbarui']);
    }

    // DELETE: Menghapus rating
    public function destroy($id)
    {
        DB::table('rating')->where('id_rating', $id)->delete();
        return response()->json(['status' => 'success', 'message' => 'Rating dihapus']);
    }

}