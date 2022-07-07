// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_final_fields, unused_field, avoid_print

import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolygonFlutter extends StatefulWidget {
  PolygonFlutter({Key? key}) : super(key: key);

  @override
  State<PolygonFlutter> createState() => _PolygonFlutterState();
}

class _PolygonFlutterState extends State<PolygonFlutter> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _polyflex = CameraPosition(
      target: LatLng(24.11975548871796, 85.31754005363054), zoom: 8);

  Set<Polygon> _poly = HashSet<Polygon>();
  List<LatLng> _list = [
    //1st
    LatLng(24.11975548871796, 85.31754005363054),
    LatLng(23.89311303132188, 86.47299429297406),
    LatLng(23.826333606451662, 87.282733806008),
    LatLng(23.38348780296378, 83.1848841986421),
    LatLng(24.11975548871796, 85.31754005363054),
    //2nd
    // LatLng(23.675015079988913, 85.14111102109968),
    // LatLng(27.469151058453452, 85.14111102109968),
    // LatLng(28.011209355444194, 76.16735641217795),
    // LatLng(22.59762172639271, 75.90107289262538),
    // LatLng(23.675015079988913, 85.14111102109968)
  ];

  @override
  void initState() {
    super.initState();
    _poly.add(
      Polygon(
          polygonId: PolygonId('1'),
          points: _list,
          fillColor: Colors.blue.withOpacity(0.5),
          geodesic: true,
          strokeWidth: 3,

          // onTap:,
          strokeColor: Colors.pinkAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Scaffold(
          body: GoogleMap(
            initialCameraPosition: _polyflex,
            polygons: _poly,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
      ),
    );
  }
}
