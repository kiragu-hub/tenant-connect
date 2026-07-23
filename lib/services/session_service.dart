import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  // Save user
  static Future<void> saveUser({
    required int id,
    required String fullname,
    required String email,
    required String role,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt("user_id", id);
    await prefs.setString("fullname", fullname);
    await prefs.setString("email", email);
    await prefs.setString("role", role);
  }

  // Read user
  static Future<Map<String, dynamic>> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    return {
      "id": prefs.getInt("user_id"),
      "fullname": prefs.getString("fullname"),
      "email": prefs.getString("email"),
      "role": prefs.getString("role"),
    };
  }

  // Logout
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}