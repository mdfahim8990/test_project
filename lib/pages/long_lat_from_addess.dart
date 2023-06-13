import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';



class GeocodingExample extends StatefulWidget {
  @override
  _GeocodingExampleState createState() => _GeocodingExampleState();
}

class _GeocodingExampleState extends State<GeocodingExample> {
  String postalCode = '881206';
   // late LatLng coordinates ;
  //LatLng coordinates = LatLng(23.87762478279079, 90.39319517034856);
  double latitude=0;
  double longitude=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geocoding Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Postal Code: $postalCode'),
            ElevatedButton(
              onPressed: () {
                convertPostalCodeToCoordinates(postalCode);
              },
              child: Text('Convert to Coordinates'),
            ),
            if (latitude != null && longitude != null)
              Text('Latitude: $latitude\nLongitude: $longitude'),
          ],
        ),
      ),
    );
  }

/*  Future<void> getCoordinatesFromPostalCode(String postalCode) async {
    try {
      List<Location> locations = await locationFromAddress(postalCode);
      if (locations.isNotEmpty) {
        setState(() {
          coordinates = LatLng(locations.first.latitude, locations.first.longitude);
        });
      } else {
        print('No locations found for the postal code');
      }
    } catch (e) {
      print('Error getting coordinates: $e');
    }
  }*/


  Future<void> convertPostalCodeToCoordinates(String postalCode) async {
    try {
      List<Location> locations = await locationFromAddress(postalCode);
      if (locations.isNotEmpty) {
        setState(() {
          latitude = locations.first.latitude;
          longitude = locations.first.longitude;
        });
      } else {
        print('No locations found for the postal code');
      }
    } catch (e) {
      print('Error converting postal code to coordinates: $e');
    }
  }
}
