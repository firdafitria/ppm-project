import 'package:flutter/material.dart';

class Checkbox01 extends StatefulWidget {
  const Checkbox01({super.key});

  @override
  State<Checkbox01> createState() => _Checkbox01State();
}

class _Checkbox01State extends State<Checkbox01> {
  bool _isChecked = false; // Menyimpan status checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contoh Checkbox 01')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Checkbox widget
            Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false; // Memperbarui status checkbox
                });
              },
            ),
            // Menampilkan status checkbox
            Text(
              _isChecked ? 'Checkbox dipilih' : 'Checkbox tidak dipilih',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}