import 'package:flutter/material.dart';
import '../features/splash/splash_screen.dart';

class TenantConnectApp extends StatelessWidget {
  const TenantConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tenant Connect',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}