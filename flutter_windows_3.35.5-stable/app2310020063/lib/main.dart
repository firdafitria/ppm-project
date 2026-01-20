import 'package:flutter/material.dart';
import 'customer_view.dart';
import 'rating_view.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Call Expert 2310020063", 
            style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.person), text: "Profil"),
              Tab(icon: Icon(Icons.star), text: "Rating"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CustomerView(),
            RatingView(),
          ],
        ),
      ),
    );
  }
}