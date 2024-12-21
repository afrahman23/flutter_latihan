import 'package:flutter/material.dart';
import 'db/database_helper.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dbHelper = DatabaseHelper();

  void _login() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    final user = await _dbHelper.loginUser(username,
password);
    if (user != null) {
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(username:
username),
      ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        snackBar(content: Text("Login gagal. Username atau
password salah.")),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: "Username"),  
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login, 
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text("Belum punya akun? Daftar"),
            ),
          ],
        ),
      ),
    );
  }
}