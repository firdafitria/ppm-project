import 'package:flutter/material.dart';
import 'radiobutton01.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Belajar Widget',
      home: RadioButton01(), // Menggunakan RadioButton01 sebagai halaman utama
    ); // MaterialApp
  }
}