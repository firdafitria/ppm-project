import 'package:flutter/material.dart';
import 'image01.dart'; // Mengimport widget Image01

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Praktikum 03',
      home: Image01(), // Menampilkan Image01 sebagai halaman utama
    );
  }
}