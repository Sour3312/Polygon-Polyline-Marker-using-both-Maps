// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, unused_field, avoid_print
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';

class SymbolFlutter extends StatefulWidget {
  SymbolFlutter({Key? key}) : super(key: key);

  @override
  State<SymbolFlutter> createState() => _SymbolFlutterState();
}

class _SymbolFlutterState extends State<SymbolFlutter> {
  static final CameraPosition _pos = CameraPosition(
      target: LatLng(25.827463070591662, 85.11805201389177), zoom: 7);
  Completer<MapmyIndiaMapController> _cont = Completer();
  late MapmyIndiaMapController controller;

  Future<void> addImage(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return controller.addImage(name, list);
  }

  void addMarker() async {
    await addImage("icon", "assets/symbol/marker.jpg");
    controller.addSymbol(SymbolOptions(
        geometry: LatLng(25.827463070591662, 85.11805201389177),
        textField: "Hi Sourabh",
        textColor: "blue",
        textSize: 12,
        // draggable: true,
        iconAnchor: "qwwe",
        iconHaloBlur: 2.2,
        iconOpacity: 0.6,
        iconSize: 0.6,
        iconColor: "Orange",
        iconImage: "icon"));
  }

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
    return MaterialApp(
      home: Material(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Icon(Icons.map_rounded),
                Spacer(),
                Text("2. Mapmyindia Symbol making"),
                Spacer(),
                Icon(Icons.search)
              ],
            ),
            centerTitle: false,
          ),
          body: MapmyIndiaMap(
            initialCameraPosition: _pos,
            onMapCreated: (map) => {controller = map},
            onStyleLoadedCallback: () => {addMarker()},
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              print("object");
              MapmyIndiaMapController controller = await _cont.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: LatLng(23.356133786884268, 85.35889580793817),
                      zoom: 10)));
            },
            child: Icon(Icons.my_location),
          ),
        ),
      ),
    );
  }
}
