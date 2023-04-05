import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jenosize/controller/search_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StorageController {
  static Future<void> cacheSearchResults(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('search_results', data);
  }

  static Future<List<dynamic>?> getCachedSearchResults() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedData = prefs.getString('search_results');

    if (cachedData != null) {
      return json.decode(cachedData);
    }
    return null;
  }

  Future<void> saveLatLngToCache(String key, LatLng latLng) async {
    final prefs = await SharedPreferences.getInstance();
    final latLngString = '${latLng.latitude},${latLng.longitude}';
    await prefs.setString(key, latLngString);
  }

  Future<LatLng?> getLatLngFromCache(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedLatLngString = prefs.getString(key);
    if (cachedLatLngString != null) {
      final latLngList = cachedLatLngString.split(',');
      final latitude = double.parse(latLngList[0]);
      final longitude = double.parse(latLngList[1]);
      return LatLng(latitude, longitude);
    }
    return null;
  }

  Future<LatLng> getLatLngFromNetwork(String key, String latLngString) async {
    final cachedLatLng = await getLatLngFromCache(key);
    if (cachedLatLng != null) {
      return cachedLatLng;
    }

    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?address=$latLngString&key=$googleApiKey'));

    if (response.statusCode == 200) {
      final result = json.decode(response.body)['results'][0];
      final latLng = result['geometry']['location'];
      final double latitude = latLng['lat'];
      final double longitude = latLng['lng'];
      final newLatLng = LatLng(latitude, longitude);
      await saveLatLngToCache(key, newLatLng);
      return newLatLng;
    } else {
      throw Exception('Failed to load latLng');
    }
  }
}
