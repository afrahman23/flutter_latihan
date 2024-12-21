import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;
  HomePage({required this.username});

  @ovveride
  Widget build(BuildContext content) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text(
          "Selamat datang, $username!"
         style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}