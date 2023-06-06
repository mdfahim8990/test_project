import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}


class _MapPageState extends State<MapPage> {


  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.871974, 90.389370),
    zoom: 14.4746,

  );
  final Completer<GoogleMapController> _controller = Completer();


/*  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(23.871974, 90.389370),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);*/

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GoogleMap(
       // mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);

        },

      ),

     /* floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),*/
    );
  }

 /* Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }*/
}
