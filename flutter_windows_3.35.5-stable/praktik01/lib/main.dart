import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); //konstruktor

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('belajar'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Text('hello', style: TextStyle(
                  fontSize: 40,
                  color: Colors.redAccent
                ),),
                Text('hello', style: TextStyle(
                  fontSize: 40,
                  color: Colors.blueAccent
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}


