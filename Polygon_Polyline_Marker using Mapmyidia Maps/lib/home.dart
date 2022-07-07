// ignore_for_file: prefer_const_constructors, constant_identifier_names, prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<MapmyIndiaMapController> _controller = Completer();

  final CameraPosition _MmiPlex = CameraPosition(
      target: LatLng(23.353139006631714, 85.303557521744), zoom: 5);

  @override
  void initState() {
    MapmyIndiaAccountManager.setMapSDKKey(
        "30eb2d59-335d-452d-adb4-e51d77090b08");
    MapmyIndiaAccountManager.setRestAPIKey("47e0624fbd6e55e8dd13e4453f089aa7");
    MapmyIndiaAccountManager.setAtlasClientId(
        "33OkryzDZsIGK9G3_WHFl8XTYLtqIgYh9kRECAhCLNPOFsP6OUvE32EyLCzy9ABln_n9_H1lybhr0DfhqKCRmQ==");
    MapmyIndiaAccountManager.setAtlasClientSecret(
        "lrFxI-iSEg_qd-T6n9as4_7fk2WPyKtFb2UomHe1n3bYmHVYbOjX-LONO_lj7mnSudXW433Iq-VywW8fVlDXFc6_2xIeyyww");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1. MapmyIndia (Sourabh Kr.)'),
      ),
      body: MapmyIndiaMap(
          initialCameraPosition: _MmiPlex,
          myLocationRenderMode: MyLocationRenderMode.COMPASS,
          compassEnabled: true,
          myLocationEnabled: true,
          myLocationTrackingMode: MyLocationTrackingMode.NoneCompass,
          onMapCreated: (MapmyIndiaMapController controller) {
            _controller.complete(controller);
          }),
    );
  }
}
