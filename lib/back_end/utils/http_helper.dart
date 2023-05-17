import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  static const String api = "http://192.168.1.2:5000/api/gujarat";
  static Future<Map<String, dynamic>> fetchPetrolPrices() async {
    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch petrol prices');
    }
  }
}
