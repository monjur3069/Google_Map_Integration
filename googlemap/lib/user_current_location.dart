import 'dart:async';

import 'package:flutter/material.dart';
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
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(23.798393, 90.333131),
        infoWindow: InfoWindow(title: 'My Position'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.local_activity),
      ),
    );
  }
}
