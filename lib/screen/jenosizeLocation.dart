// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jenosize/controller/storage_controller.dart';
import 'package:jenosize/screen/widget/navbar.dart';

class JenosizeLocation extends StatefulWidget {
  @override
  _JenosizeLocationState createState() => _JenosizeLocationState();
}

class _JenosizeLocationState extends State<JenosizeLocation> {
  final StorageController _storageController = StorageController();
  final LatLng _jenosizeLatLng =
      const LatLng(13.894010248951382, 100.5163165286379);

  Set<Marker> _createMarkers() {
    return <Marker>{
      Marker(
        markerId: const MarkerId('jenosize'),
        position: _jenosizeLatLng,
        infoWindow: const InfoWindow(title: 'Jenosize'),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jenosize Location'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _jenosizeLatLng, zoom: 16),
              markers: _createMarkers(),
            ),
          ),
        ],
      ),
    );
  }
}
