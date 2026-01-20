import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RatingView extends StatefulWidget {
  const RatingView({super.key});

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  final TextEditingController ulasanController = TextEditingController();
  int _selectedRating = 5; // Default rating 5 bintang

  void kirimRating() async {
    if (ulasanController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Silakan isi ulasan terlebih dahulu")),
      );
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/rating'),
        body: {
          'id_tukang': '2',
          'id_pesanan': '1',
          'id_customer': '2',
          'rating': _selectedRating.toString(),
          'ulasan': ulasanController.text,
        },
      );
      
      if (response.statusCode == 201) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Berhasil Terkirim! Terima kasih."),
            backgroundColor: Colors.green,
          ),
        );
        ulasanController.clear();
        setState(() => _selectedRating = 5);
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Berikan Penilaian",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Bagaimana pengalaman Anda menggunakan layanan kami?",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 25),
          
          // Kartu Input Rating
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                // Selector Bintang
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      onPressed: () => setState(() => _selectedRating = index + 1),
                      icon: Icon(
                        index < _selectedRating ? Icons.star_rounded : Icons.star_outline_rounded,
                        color: Colors.amber,
                        size: 45,
                      ),
                    );
                  }),
                ),
                Text(
                  "$_selectedRating / 5 Bintang",
                  style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.amber),
                ),
                const SizedBox(height: 25),
                
                // TextField Ulasan
                TextField(
                  controller: ulasanController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Tulis pengalaman Anda di sini...",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                  ),
                ),
                const SizedBox(height: 25),
                
                // Tombol Kirim
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: kirimRating,
                    icon: const Icon(Icons.send_rounded),
                    label: const Text(
                      "KIRIM RATING",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}