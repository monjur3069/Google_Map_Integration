import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatLangGeoCoding extends StatefulWidget {
  const ConvertLatLangGeoCoding({Key? key}) : super(key: key);

  @override
  State<ConvertLatLangGeoCoding> createState() =>
      _ConvertLatLangGeoCodingState();
}

class _ConvertLatLangGeoCodingState extends State<ConvertLatLangGeoCoding> {
  String latlngToAddress = '';
  String addressToLatLng = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: _convert, child: const Text('Convert ')),
          SizedBox(
            height: 10,
          ),
          Text(
            'LatLang to Address',
            style: TextStyle(color: Colors.deepOrange, fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Text(latlngToAddress),
          SizedBox(
            height: 10,
          ),
          Text(
            'Address to LatLang',
            style: TextStyle(color: Colors.deepOrange, fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Text(addressToLatLng),
        ],
      )),
    );
  }

  void _convert() async {
    List<Location> locations =
        await locationFromAddress("Gronausestraat 710, Enschede");
    List<Placemark> placemarks =
        await placemarkFromCoordinates(52.2165157, 6.9437819);

    setState(() {
      addressToLatLng = "Lat: "+locations.last.latitude.toString() + ", Lng: " + locations.last.longitude.toString();
      latlngToAddress = placemarks.reversed.last.country.toString() +
          ", " +
          placemarks.reversed.last.street.toString() +
          ", " +
          placemarks.reversed.last.postalCode.toString();
    });
  }
}
