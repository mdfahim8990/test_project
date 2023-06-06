import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latLng;


class map extends StatefulWidget {
  const map({Key? key}) : super(key: key);

  @override
  State<map> createState() => _mapState();
}
class _mapState extends State<map> {
  double latLang1= 51.479122;
  double latLang2=-2.591342;

  //LatLng currentLocations =  LatLng(51.509364, -0.128928);

  double zoom = 8;
  Key mapKey = UniqueKey();
  double lat =0;
  double long =0;

 Future<Position> _getCurrentLocation()async{
   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
   if(!serviceEnabled){
     return Future.error("error");
   }
   LocationPermission permission = await Geolocator.checkPermission();
   if(permission== LocationPermission.denied){
     permission = await Geolocator.requestPermission();
     if(permission== LocationPermission.denied){
       return Future.error("Denied");
     }
   }
if( permission== LocationPermission.deniedForever){
  return Future.error("permanently deny");
}
return await Geolocator.getCurrentPosition();
 }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              //for showing map
              SizedBox(
                height: MediaQuery.of(context).size.height-50,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    FlutterMap(
                      key: mapKey,
                      options: MapOptions(center: latLng.LatLng(lat==0 ? latLang1: lat, long==0?latLang2:long), zoom: zoom,),

                      children: [
                        TileLayer(
                          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(point: latLng.LatLng(lat,long), builder: (BuildContext context) => Icon(Icons.pin_drop,color: Colors.red,size: 40,) ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 16.0,
                      right: 16.0,
                      child: FloatingActionButton(
                        onPressed: () {
                          _getCurrentLocation().then((value) {

                            latLang1 = value.latitude.toDouble() ;
                            latLang2 = value.longitude.toDouble();
                          });
                          locate();
                          print("lat :$latLang1 ,long: $latLang2");
                        },
                        child: const Icon(Icons.my_location),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3,),
             /* ElevatedButton(
                child: const Text('Use current location'),
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> SalatTimeScreenMobile(currentLocation: currentLocation))),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
  Future<void> locate() async {
    Position a = await determinePosition();
    setState(() {
      zoom = 14;
     // currentLocations = LatLng(a.latitude1, a.longitude);
lat = latLang1;
long = latLang2;
      mapKey = UniqueKey();
    });
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
