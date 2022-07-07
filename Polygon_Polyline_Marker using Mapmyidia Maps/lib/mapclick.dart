// ignore_for_file: prefer_const_constructors, prefer_const_declarations, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter_mapmyindia_gl_app/utils/color.dart';

import 'package:mapmyindia_gl/mapmyindia_gl.dart';

class MapClickEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MapClickEventState();
  }
}

class MapClickEventState extends State {
  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(28.551087, 77.257373),
    zoom: 10.0,
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
          'Map Click',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.2,
      ),
      body: MapmyIndiaMap(
        initialCameraPosition: _kInitialPosition,
        onMapClick: (point, latlng) => {
          // print(latlng.toString()),
          Fluttertoast.showToast(
              msg: latlng.toString(),
              textColor: Colors.yellow,
              timeInSecForIosWeb: 3,
              backgroundColor: Color.fromARGB(255, 11, 224, 18),
              toastLength: Toast.LENGTH_LONG,
              webBgColor: "blue",
              webPosition: "right",
              webShowClose: false,
              gravity: ToastGravity.BOTTOM)
        },
      ),
    );
  }
}
