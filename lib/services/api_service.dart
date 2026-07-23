import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://127.0.0.1/tenantconnect_api";

  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login.php"),
      body: {
        "email": email,
        "password": password,
      },
    );

    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> register({
    required String fullname,
    required String email,
    required String phone,
    required String password,
    required String role,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register.php"),
      body: {
        "fullname": fullname,
        "email": email,
        "phone": phone,
        "password": password,
        "role": role,
      },
    );

    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> addProperty({
    required int landlordId,
    required String title,
    required String description,
    required String propertyType,
    required String location,
    required double price,
    required int bedrooms,
    required int bathrooms,
    required int diningRooms,
    required String amenities,
    required String image,
    required String status,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/add_property.php"),
      body: {
        "landlord_id": landlordId.toString(),
        "title": title,
        "description": description,
        "property_type": propertyType,
        "location": location,
        "price": price.toString(),
        "bedrooms": bedrooms.toString(),
        "bathrooms": bathrooms.toString(),
        "dining_rooms": diningRooms.toString(),
        "amenities": amenities,
        "image": image,
        "status": status,
      },
    );

    return jsonDecode(response.body);
  }

  static Future<List<dynamic>> getProperties() async {
    final response = await http.get(
      Uri.parse("$baseUrl/get_properties.php"),
    );

    final data = jsonDecode(response.body);

    if (data["success"] == true) {
      return data["properties"];
    }

    return [];
  }
}