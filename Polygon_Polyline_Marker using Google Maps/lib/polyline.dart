// ignore_for_file: prefer_const_constructors, unused_field, prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineFlutter extends StatefulWidget {
  PolylineFlutter({Key? key}) : super(key: key);

  @override
  State<PolylineFlutter> createState() => _PolylineFlutterState();
}

class _PolylineFlutterState extends State<PolylineFlutter> {
  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _pline = CameraPosition(
      target: LatLng(
        23.828298237638506,
        86.90704511152356,
      ),
      zoom: 4);

  final Set<Polyline> _poline = {};
  final Set<Marker> _marker = {};

  final List<LatLng> _lists = [
    LatLng(31.630610488031216, 76.39600750698315),
    LatLng(23.17112701955466, 70.78907331509306),
    LatLng(21.109502106477272, 79.63151836683626),
    LatLng(25.766987015315916, 86.0486410288528),
    LatLng(14.571854404634275, 77.25805157672102),
    LatLng(8.088398867944424, 77.53784523658899),
    LatLng(12.384119825023054, 64.82766145991857)
    // LatLng(23.828298237638506, 86.90704511152356),
    // LatLng(23.911326772695546, 86.43794053750223),
    // LatLng(23.28732301473069, 86.3673226446388)
  ];

  @override
  void initState() {
    super.initState();

    //set up marker positions
    for (var i = 0; i < _lists.length; i++) {
      _marker.add(Marker(
          markerId: MarkerId("2"),
          position: _lists[i],
          infoWindow:
              InfoWindow(title: "Polyline in flutter", snippet: "Sourabh Kr."),
          icon: BitmapDescriptor.defaultMarker));
      setState(() {});

      _poline.add(Polyline(
          polylineId: PolylineId("1"),
          points: _lists,
          color: Colors.blue,
          width: 2));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Scaffold(
          body: GoogleMap(
              markers: _marker,
              polylines: _poline,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition: _pline),
        ),
      ),
    );
  }
}
