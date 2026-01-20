import 'package:flutter/material.dart';
import 'studikasus01.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan 01',
      home: Studikasus01(),
    ); // MaterialApp
  }
}