import 'package:flutter/material.dart';
import 'package:googlemap/homepage.dart';

import 'convert_latlang_flutter_geocoder.dart';
import 'convert_latlang_geocoding.dart';
import 'user_current_location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CurrectLocation()
    );
  }
}


