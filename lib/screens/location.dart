import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Location extends StatelessWidget {
  final String latitude;
  final String longitude;

  Location({required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    final LatLng userLocation = LatLng(double.parse(latitude), double.parse(longitude));

    return Scaffold(
      
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: userLocation,
          zoom: 14, 
        ),
        markers: {
          Marker(
            markerId: MarkerId('userLocation'),
            position: userLocation,
          ),
        },
      ),
    );
  }
}
