import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomerView extends StatefulWidget {
  const CustomerView({super.key});

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  String namaCustomer = "Memuat...";
  String emailCustomer = "...";

  Future<void> ambilData() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/customer/2'));
      if (response.statusCode == 200) {
        var hasil = jsonDecode(response.body);
        setState(() {
          namaCustomer = hasil['data']['nama'];
          emailCustomer = hasil['data']['email'];
        });
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    ambilData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan Gradasi
            Container(
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.blueAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 60, color: Colors.indigo),
                  ),
                ),
              ),
            ),

            // Detail Informasi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Informasi Pribadi",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  
                  _buildInfoTile(
                    icon: Icons.badge_outlined,
                    label: "Nama Lengkap",
                    value: namaCustomer,
                  ),
                  
                  const SizedBox(height: 15),
                  
                  _buildInfoTile(
                    icon: Icons.email_outlined,
                    label: "Alamat Email",
                    value: emailCustomer,
                  ),

                  const SizedBox(height: 30),
                  
                  // PERBAIKAN DI SINI: Menggunakan SizedBox, bukan S Nelson
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Logika logout bisa ditaruh di sini
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text("Keluar Akun"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile({required IconData icon, required String label, required String value}) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo, size: 30),
          const SizedBox(width: 20),
          Expanded( // Tambahkan Expanded agar teks tidak overflow jika terlalu panjang
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Text(value, 
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis, // Tambahan keamanan teks
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}