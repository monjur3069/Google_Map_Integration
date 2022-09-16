import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrectLocation extends StatefulWidget {
  const CurrectLocation({Key? key}) : super(key: key);

  @override
  State<CurrectLocation> createState() => _CurrectLocationState();
}

class _CurrectLocationState extends State<CurrectLocation> {
  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(23.798393, 90.333131), zoom: 14);

  static const CameraPosition _kLake = CameraPosition(
      target: LatLng(23.7546655, 90.3914849), zoom: 19.151926040649414);

  List<Marker> _marker = [];
  final List<Marker> _list = [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(23.798393, 90.333131),
        infoWindow: InfoWindow(title: 'My Position'))
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(

            onPressed: () {
              getUserCurrentLocaion().then((value) async {
                print('My Current Locaion : ');
                print(value.latitude.toString() + value.longitude.toString());

                _marker.add(Marker(
                    markerId: MarkerId("2"),
                    position: LatLng(value.latitude, value.longitude),
                    infoWindow: InfoWindow(title: 'My current Locaion')));
                CameraPosition cameraPosition =
                    CameraPosition(
                        zoom: 14,
                        target: LatLng(value.latitude, value.longitude));
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                setState(() {

                });
              });
            },
            child: Icon(Icons.gps_fixed),

          ),
        ),

      ),
    );
  }

  Future<Position> getUserCurrentLocaion() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print('error ' + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }
}
