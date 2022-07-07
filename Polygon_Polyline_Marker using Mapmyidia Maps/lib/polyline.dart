// ignore_for_file: unnecessary_import, prefer_const_declarations, prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';

class AddPolylineWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddPolylineState();
  }
}

class AddPolylineState extends State {
  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(23.360040306195387, 85.36189271841633),
    zoom: 8.0,
  );

  late MapmyIndiaMapController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        title: Text(
          '4. Add Polyline',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.2,
      ),
      body: MapmyIndiaMap(
        initialCameraPosition: _kInitialPosition,
        onMapCreated: (map) => {
          controller = map,
        },
        onStyleLoadedCallback: () => {addMarker()},
      ),
    );
  }

  void addMarker() async {
    List<LatLng> latlng = <LatLng>[
      LatLng(23.360040306195387, 85.36189271841633),
      LatLng(23.373065826180163, 85.33730190789414),
      LatLng(23.346703134387088, 85.30828812201278),
      LatLng(23.33090397023815, 85.37313671464709),
      LatLng(23.373691759578616, 85.36080497789914),
      LatLng(23.355752593549333, 85.34989028750385),
    ];
    LatLngBounds latLngBounds = boundsFromLatLngList(latlng);
    controller.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds));
    controller.addLine(
        LineOptions(geometry: latlng, lineColor: "orange", lineWidth: 8));
  }

  boundsFromLatLngList(List<LatLng> list) {
    assert(list.isNotEmpty);
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null || x1 == null || y0 == null || y1 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1) y1 = latLng.longitude;
        if (latLng.longitude < y0) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
        northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
  }
}
