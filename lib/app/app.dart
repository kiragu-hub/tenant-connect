import 'package:flutter/material.dart';
import 'package:tenant_connect/app/router/app_router.dart';
import 'package:tenant_connect/app/theme/app_theme.dart';
import 'package:tenant_connect/core/constants/app_constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: '/',
    );
  }
}
