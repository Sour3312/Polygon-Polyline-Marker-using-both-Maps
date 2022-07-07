// ignore_for_file: prefer_const_declarations, prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_mapmyindia_gl_app/utils/color.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';

class GeocodeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GeocodeWidgetState();
  }
}

class GeocodeWidgetState extends State {
  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(25.321684, 82.987289),
    zoom: 10.0,
  );

  late MapmyIndiaMapController controller;

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
        centerTitle: true,
        // backgroundColor: MyColor.colorPrimary,
        brightness: Brightness.dark,
        title: Text(
          'Geocoding API',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.2,
      ),
      body: MapmyIndiaMap(
        initialCameraPosition: _kInitialPosition,
        onMapCreated: (map) => {
          controller = map,
        },
        onStyleLoadedCallback: () => {callGeocode()},
      ),
    );
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return controller.addImage(name, list);
  }

  void addMarker(LatLng latLng) async {
    await addImageFromAsset("icon", "assets/symbol/s1.png");
    controller.addSymbol(SymbolOptions(geometry: latLng, iconImage: 'icon'));
    controller.animateCamera(CameraUpdate.newLatLngZoom(latLng, 14));
  }

  callGeocode() async {
    try {
      GeocodeResponse? response =
          await MapmyIndiaGeoCoding(address: "Saket").callGeocoding();
      if (response != null &&
          response.results != null &&
          response.results!.length > 0) {
        addMarker(LatLng(
            response.results![0].latitude!, response.results![0].longitude!));
      }
    } catch (e) {
      if (e is PlatformException) {
        Fluttertoast.showToast(msg: '${e.code} --- ${e.message}');
      }
    }
  }
}
