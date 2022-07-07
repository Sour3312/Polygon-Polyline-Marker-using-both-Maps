// ignore_for_file: prefer_final_fields, prefer_const_constructors, avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetCurrentLocation extends StatefulWidget {
  GetCurrentLocation({Key? key}) : super(key: key);

  @override
  State<GetCurrentLocation> createState() => _GetCurrentLocationState();
}

class _GetCurrentLocationState extends State<GetCurrentLocation> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _start = CameraPosition(
      target: LatLng(
        26.985060084542408,
        75.75105947027761,
      ),
      zoom: 10);

  Future<Position> MyLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error " + error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _start,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("my location");
            MyLocation().then((value) {
              print(
                  value.latitude.toString() + " " + value.longitude.toString());
            });
          },
          child: Icon(Icons.my_location)),
    );
  }
}
