import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
  padding: const EdgeInsets.all(24.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [

      const Text(
        "Tenant Connect",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 10),

      const Text(
        "Welcome Back",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),

      const SizedBox(height: 40),

      const TextField(
        decoration: InputDecoration(
          labelText: "Email",
          border: OutlineInputBorder(),
        ),
      ),

      const SizedBox(height: 20),

      const TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Password",
          border: OutlineInputBorder(),
        ),
      ),

      const SizedBox(height: 30),

      SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("LOGIN"),
        ),
      ),

      const SizedBox(height: 20),

  TextButton(
  onPressed: () {},
  child: const Text("Forgot Password?"),
),

    ],
  ),
),
    );
  }
}