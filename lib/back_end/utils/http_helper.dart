import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  static Future<Map<String, dynamic>> fetchPetrolPrices() async {
    final response =
        await http.get(Uri.parse('http://192.168.2.13:5000/api/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch petrol prices');
    }
  }
}
