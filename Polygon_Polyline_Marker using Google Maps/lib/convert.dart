// ignore_for_file: prefer_const_constructors, prefer_const_declarations, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

class Convert extends StatefulWidget {
  Convert({Key? key}) : super(key: key);

  @override
  State<Convert> createState() => _ConvertState();
}

class _ConvertState extends State<Convert> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Convert'),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      print("Tap");

                      final query = "jamshedpur";
                      var addresses =
                          await Geocoder.local.findAddressesFromQuery(query);
                      var first = addresses.first;
                      print("${first.featureName} : ${first.coordinates}");

// From coordinates
                      final coordinates = Coordinates(22.8045665, 86.2028754);
                      addresses = await Geocoder.local
                          .findAddressesFromCoordinates(coordinates);
                      first = addresses.first;
                      print("${first.featureName} : ${first.addressLine}");
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Tap to get coordinates',
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
