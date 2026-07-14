import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tenantconnect/app/router/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.login,
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(30),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),

              const SizedBox(height: 30),

              const Text(
                "TENANT CONNECT",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Find. Connect. Live Better.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 60),

              const CircularProgressIndicator(),

            ],
          ),
        ),
      ),
    );
  }
}