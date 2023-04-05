import 'package:flutter/material.dart';
import 'package:jenosize/controller/search_controller.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  final _searchControllerInstance = SearchController();
  List<dynamic> _results = [];

  Future<void> _searchRestaurants(String query) async {
    final results = await _searchControllerInstance.searchRestaurants(query);
    setState(() {
      _results = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Restaurants'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _searchRestaurants(_searchController.text);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _results.length,
              itemBuilder: (context, index) {
                final restaurant = _results[index];
                return ListTile(
                  leading: restaurant['photos'] != null
                      ? Image.network(
                          'https://maps.googleapis.com/maps/api/place/photo?maxwidth=100&photoreference=${restaurant['photos'][0]['photo_reference']}&key=$googleApiKey')
                      : SizedBox(
                          width: 150, height: 150, child: Icon(Icons.image)),
                  title: Text(restaurant['name']),
                  subtitle: Text(restaurant['vicinity']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
