import 'dart:convert';

import 'package:http/http.dart' as http;

const String googleApiKey = 'AIzaSyBl4p1pmTY1BUnEYqteKEeEtFTd-qJuuG4';

class SearchController {
  Future<List> searchRestaurants(String query) async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&type=restaurant&key=$googleApiKey'));
    print('Request URL: $response');
    if (response.statusCode == 200) {
      print('Response Body: ${response.body}');
      return json.decode(response.body)['results'];
    } else {
      throw Exception('Failed to load restaurants');
    }
  }
}
