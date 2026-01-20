import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// StatelessWidget untuk bagian utama aplikasi (tidak berubah)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menghitung Luas Lingkaran',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LuasLingkaranPage(),
    );
  }
}

// StatefulWidget untuk halaman utama yang mengelola state input dan hasil
class LuasLingkaranPage extends StatefulWidget {
  const LuasLingkaranPage({super.key});

  @override
  _LuasLingkaranPageState createState() => _LuasLingkaranPageState();
}

class _LuasLingkaranPageState extends State<LuasLingkaranPage> {
  final TextEditingController _radiusController = TextEditingController();
  double? _luas; // Variabel untuk menyimpan hasil luas
  String _errorMessage = ''; // Variabel untuk pesan error

  void _hitungLuas() {
    setState(() {
      _errorMessage = '';
      final radiusText = _radiusController.text;
      if (radiusText.isEmpty) {
        _errorMessage = 'Masukkan jari-jari!';
        _luas = null;
        return;
      }
      final radius = double.tryParse(radiusText);
      if (radius == null || radius <= 0) {
        _errorMessage = 'Jari-jari harus angka positif!';
        _luas = null;
        return;
      }
      // Rumus luas lingkaran: π * r²
      const pi = 3.14159;
      _luas = pi * (radius * radius);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menghitung Luas Lingkaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Masukkan Jari-Jari Lingkaran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _radiusController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jari-Jari (r)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _hitungLuas,
              child: const Text('Hitung Luas'),
            ),
            const SizedBox(height: 16),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            if (_luas != null)
              Text(
                'Luas Lingkaran: ${_luas!.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _radiusController.dispose();
    super.dispose();
  }
}