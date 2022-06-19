import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final int days = 30;
  final String name = "Shallu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog log'),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days flutter by $name"),
        ),
      ),
      drawer: Drawer(), // drawer matlab jo side mein 3 dot aate hai woh
    );
  }
}
