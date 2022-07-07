// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_constructors_in_immutables, deprecated_member_use, prefer_const_declarations

// import 'package:flutter/material.dart';
// import 'package:mapmyindia_gl/mapmyindia_gl.dart';

// class PolygonFlutter extends StatefulWidget {
//   PolygonFlutter({Key? key}) : super(key: key);

//   @override
//   State<PolygonFlutter> createState() => _PolygonFlutterState();
// }

// class _PolygonFlutterState extends State<PolygonFlutter> {
//   CameraPosition _polygonn = CameraPosition(
//       target: LatLng(23.357742423903186, 85.3477467518928), zoom: 10);

//   late MapmyIndiaMapController controller;
// @override
//   void initState() {
//     MapmyIndiaAccountManager.setMapSDKKey(
//         "6c853500-3e58-47fc-bcca-f9e978dae691");
//     MapmyIndiaAccountManager.setRestAPIKey("47e0624fbd6e55e8dd13e4453f089aa7");
//     MapmyIndiaAccountManager.setAtlasClientId(
//         "33OkryzDZsIGK9G3_WHFl8XTYLtqIgYh9kRECAhCLNPOFsP6OUvE32EyLCzy9ABln_n9_H1lybhr0DfhqKCRmQ==");
//     MapmyIndiaAccountManager.setAtlasClientSecret(
//         "lrFxI-iSEg_qd-T6n9as4_7fk2WPyKtFb2UomHe1n3bYmHVYbOjX-LONO_lj7mnSudXW433Iq-VywW8fVlDXFc6_2xIeyyww");
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             backgroundColor: Colors.red,
//             brightness: Brightness.dark,
//             title: Text(
//               'Add Polygon',
//               style: TextStyle(color: Colors.white),
//             ),
//             elevation: 0.2,
//           ),
//           body: MapmyIndiaMap(
//             initialCameraPosition: _polygonn,
//             onMapCreated: (map) => {controller = map},
//             onStyleLoadedCallback: () => {addPolygon()},
//           ),
//         )
//      ;
//   }

//   void addPolygon() async {
//     List<List<LatLng>> latlng = [
//       <LatLng>[
//         LatLng(23.400756580687027, 85.25130264730261),
//         LatLng(23.39382454598285, 85.39824478391249),
//         LatLng(23.28097050194581, 85.41197769387604),
//         LatLng(23.299891274469378, 85.23756973733907),
//         LatLng(23.400756580687027, 85.25130264730261),
//       ]
//     ];
//     LatLngBounds latLngBounds = boundsFromLatLngList(latlng.first);
//     controller.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds));
//     controller.addFill(FillOptions(geometry: latlng, fillColor: "blue"));
//   }

//   boundsFromLatLngList(List<LatLng> list) {
//     assert(list.isNotEmpty);
//     double? x0, x1, y0, y1;
//     for (LatLng ltng in list) {
//       if (x0 == null || x1 == null || y0 == null || y1 == null) {
//         x0 = x1 = ltng.latitude;
//         y0 = y1 = ltng.longitude;
//       } else {
//         if (ltng.latitude > x1) x1 = ltng.latitude;
//         if (ltng.latitude < x0) x0 = ltng.latitude;
//         if (ltng.longitude > y1) y1 = ltng.longitude;
//         if (ltng.longitude < y0) y0 = ltng.longitude;
//       }
//       return LatLngBounds(
//           northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
//     }

// same but second part

import 'package:flutter/material.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';

class AddPolygonWidget extends StatefulWidget {
  const AddPolygonWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AddPolygonState();
  }
}

class AddPolygonState extends State {
  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(25.321684, 82.987289),
    zoom: 10.0,
  );

  late MapmyIndiaMapController controller;
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
        brightness: Brightness.dark,
        title: Text(
          '3. Polygon using Flutter ',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.2,
      ),
      body: MapmyIndiaMap(
        initialCameraPosition: _kInitialPosition,
        onMapCreated: (map) => {
          controller = map,
        },
        onStyleLoadedCallback: () => {addPolygon()},
      ),
    );
  }

  void addPolygon() async {
    List<List<LatLng>> latlng = [
      <LatLng>[
        LatLng(23.400756580687027, 85.25130264730261),
        LatLng(23.39382454598285, 85.39824478391249),
        LatLng(23.28097050194581, 85.41197769387604),
        LatLng(23.299891274469378, 85.23756973733907),
        LatLng(23.400756580687027, 85.25130264730261),
      ]
    ];
    LatLngBounds latLngBounds = boundsFromLatLngList(latlng.first);
    controller.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds));
    controller.addFill(
        FillOptions(geometry: latlng, fillColor: "red", fillOpacity: 0.4));
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
