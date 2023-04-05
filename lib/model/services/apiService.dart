// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = "AIzaSyBl4p1pmTY1BUnEYqteKEeEtFTd-qJuuG4";

  Future<List<dynamic>> searchRestaurants(String query) async {
    final String url =
        "https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&type=restaurant&key=$apiKey";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
