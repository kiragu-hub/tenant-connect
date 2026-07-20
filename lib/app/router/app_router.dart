import 'package:flutter/material.dart';
import 'package:tenant_connect/features/auth/presentation/screens/login_screen.dart';
import 'package:tenant_connect/features/home/presentation/screens/home_screen.dart';
import 'package:tenant_connect/features/messages/presentation/screens/messages_screen.dart';
import 'package:tenant_connect/features/profile/presentation/screens/profile_screen.dart';
import 'package:tenant_connect/features/property/presentation/screens/property_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/property':
        return MaterialPageRoute(builder: (_) => const PropertyScreen());
      case '/messages':
        return MaterialPageRoute(builder: (_) => const MessagesScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
