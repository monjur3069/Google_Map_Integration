import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

class ConvertLatLang extends StatefulWidget {
  const ConvertLatLang({Key? key}) : super(key: key);

  @override
  State<ConvertLatLang> createState() => _ConvertLatLangState();
}

class _ConvertLatLangState extends State<ConvertLatLang> {

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
            SizedBox(height: 10,),
            Text('LatLang to Address',style: TextStyle(color: Colors.deepOrange,fontSize: 18),),
            SizedBox(height: 5,),
            Text(latlngToAddress),
            SizedBox(height: 10,),
            Text('Address to LatLang',style: TextStyle(color: Colors.deepOrange,fontSize: 18),),
            SizedBox(height: 5,),
            Text(addressToLatLng),

          ],
        )
      ),
    );
  }

  void _convert() async{

    // From a query
    final query = "1600 Amphiteatre Parkway, Mountain View";
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    var Second = addresses.first;
    print("${Second.featureName} : ${Second.coordinates}");


    // From a Coordinates
    final coordinates = new Coordinates(23.7966656,90.349995);
    var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = address.first;


    setState(() {
      addressToLatLng = Second.featureName.toString() + Second.coordinates.toString();
      latlngToAddress = first.featureName.toString() + first.addressLine.toString();

    });
  }
}
