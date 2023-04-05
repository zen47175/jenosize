import 'dart:convert';

import 'package:http/http.dart' as http;

const String googleApiKey = 'YOUR_API_KEY_HERE';

class SearchController {
  Future<List> searchRestaurants(String query) async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&type=restaurant&key=$googleApiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['results'];
    } else {
      throw Exception('Failed to load restaurants');
    }
  }
}
