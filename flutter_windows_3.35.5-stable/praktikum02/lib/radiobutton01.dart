import 'package:flutter/material.dart';

class RadioButton01 extends StatefulWidget {
  const RadioButton01({super.key});

  @override
  _RadioButton01State createState() => _RadioButton01State();
}

class _RadioButton01State extends State<RadioButton01> {
  String? _selectedOption; // Menyimpan pilihan yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contoh RadioButton')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Tambahan untuk tampilan rapi
          children: [
            // Judul untuk pilihan
            const Text(
              'Pilih Hobi Anda:', 
              style: TextStyle(fontSize: 20),
            ),
            
            // RadioButton untuk pilihan 1
            RadioListTile<String>(
              title: const Text('Bermain Musik'),
              value: 'Bermain Musik',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value; // Memperbarui pilihan yang dipilih
                });
              },
            ),

            // RadioButton untuk pilihan 2
            RadioListTile<String>(
              title: const Text('Olahraga'),
              value: 'Olahraga',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value; // Memperbarui pilihan yang dipilih
                });
              },
            ),
            
            // RadioButton untuk pilihan 3
            RadioListTile<String>(
              title: const Text('Membaca'),
              value: 'Membaca',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value; // Memperbarui pilihan yang dipilih
                });
              },
            ),

            // Menampilkan pilihan yang dipilih
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                _selectedOption != null
                    ? 'Hobi yang dipilih: \$$_selectedOption'
                    : 'Silakan pilih hobi.',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}