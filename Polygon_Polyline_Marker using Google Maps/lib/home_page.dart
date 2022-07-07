// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_final_fields, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

//camera position starting point
  static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(23.348232666981215, 85.30896400832225), zoom: 14);

//marker section
  List<Marker> _markers = [];
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(23.348232666981215, 85.30896400832225),
        infoWindow: InfoWindow(title: 'Sourabh\'s office', snippet: "Hi Srv")),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(23.336254180632565, 85.24613594999539),
        infoWindow: InfoWindow(title: 'Sourabh\'s Home', snippet: "Hi Srv")),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(23.330579783634665, 85.37728523021865),
        infoWindow: InfoWindow(title: 'Sourabh\'s Collage', snippet: "Hi Srv")),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(23.376211947122254, 85.3368658268461),
        infoWindow: InfoWindow(title: 'Sourabh\'s Collage', snippet: "Hi Srv")),
  ];

  @override
  void initState() {
    super.initState();
    _markers.addAll(_list);
  }

//main section
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marker using GMaps"),
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_markers),//set markers

          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          compassEnabled: true,
          mapType: MapType.hybrid,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      //take me to another location
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("pressed");
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(28.552447869047825, 77.27023638732784),
                  zoom: 17)));
        },
        tooltip: 'Go to the lake',
        child: Icon(Icons.my_location),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
