// ignore_for_file: prefer_const_declarations, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:mapmyindia_gl/mapmyindia_gl.dart';

class CurrentLocationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CurrentLocationState();
  }
}

class CurrentLocationState extends State {
  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(25.321684, 82.987289),
    zoom: 5.0,
  );

  @override
  void initState() {
    MapmyIndiaAccountManager.setMapSDKKey(
        "6c853500-3e58-47fc-bcca-f9e978dae691");
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
          centerTitle: true,
          // backgroundColor: MyColor.colorPrimary,
          brightness: Brightness.dark,
          title: Text(
            'Location Camera Option',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0.2,
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: MapmyIndiaMap(
            initialCameraPosition: _kInitialPosition,
            showGeoAnalyticsInfoWindow: true,
            // myLocationEnabled: true,
            // myLocationTrackingMode: MyLocationTrackingMode.Tracking,
          ))
        ]));
  }
}
