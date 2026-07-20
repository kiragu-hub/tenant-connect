// lib/features/auth/data/services/auth_service.dart
class AuthService {
  static Future<void> login({
    required String email,
    required String password,
  }) async {
    // TODO: replace with real API call (e.g. Firebase, REST, etc.)
    await Future.delayed(const Duration(seconds: 1));

    if (email.isEmpty || password.isEmpty) {
      throw Exception("Invalid credentials");
    }
    // On success: store token/session here
  }

  static Future<void> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    // TODO: replace with real API call
    await Future.delayed(const Duration(seconds: 1));
    // On success: maybe auto-login or navigate to login screen
  }
}