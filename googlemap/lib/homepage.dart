import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemap/const_file.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(markerId: MarkerId('1'),
        position: LatLng(23.798393, 90.333131),
        infoWindow: InfoWindow(title: 'My Position')
    )
  ];

  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex =
  CameraPosition(target: LatLng(23.798393, 90.333131), zoom: 14);

  static const CameraPosition _kLake = CameraPosition(
      target: LatLng(23.7546655,90.3914849),
      zoom: 19.151926040649414);

  @override
  void initState() {
    _marker.addAll(_list);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          mapType: mapType,
          markers: Set<Marker>.of(_marker),
          initialCameraPosition: _kGooglePlex,
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          }),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
