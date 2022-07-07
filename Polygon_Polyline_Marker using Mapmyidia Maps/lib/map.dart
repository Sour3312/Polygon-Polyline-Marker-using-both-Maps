// // ignore_for_file: constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

// import 'package:flutter/material.dart';
// import 'package:mapmyindia_gl/mapmyindia_gl.dart';

// class MapsDemo extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return MapDemoState();
//   }
// }

// class MapDemoState extends State {
//   static const String MAP_SDK_KEY = "";
//   static const String REST_API_KEY = "";
//   static const String ATLAS_CLIENT_ID = "";
//   static const String ATLAS_CLIENT_SECRET = "";


//   @override
//   void initState() {
//     super.initState();

//     MapmyIndiaAccountManager.setMapSDKKey(
//         "6c853500-3e58-47fc-bcca-f9e978dae691");
//     MapmyIndiaAccountManager.setRestAPIKey("47e0624fbd6e55e8dd13e4453f089aa7");
//     MapmyIndiaAccountManager.setAtlasClientId(
//         "33OkryzDZsIGK9G3_WHFl8XTYLtqIgYh9kRECAhCLNPOFsP6OUvE32EyLCzy9ABln_n9_H1lybhr0DfhqKCRmQ==");
//     MapmyIndiaAccountManager.setAtlasClientSecret(
//         "lrFxI-iSEg_qd-T6n9as4_7fk2WPyKtFb2UomHe1n3bYmHVYbOjX-LONO_lj7mnSudXW433Iq-VywW8fVlDXFc6_2xIeyyww");
//     setState(() {
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             backgroundColor: Colors.greenAccent, title: Text(" MapmyIndia GL")),
//         drawer: mapDrawer());
//     // body: itemList(context));
//   }

//   Drawer mapDrawer() {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left: 0.0, right: 0.0),
//         children: <Widget>[
//           Container(
//             // ignore: prefer_const_constructors
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//               colors: [
//                 Colors.greenAccent,
//                 // Colors.greenAccentDark,
//                 // MyColor.colorAccent
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             )),
//             height: 170,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 SizedBox(
//                   height: 110,
//                 ),
//                 Text(
//                   "MapmyIndia Flutter Sample",
//                   style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//               ],
//             ),
//           ),
//           ListTile(
//             title: Text('Map Events'),
//             onTap: () => {
//               setState(() {
                
//               Navigator.pop(context)
//             },
//           ),
//           ListTile(
//             title: Text('Camera'),
//             onTap: () => {
//               setState(() {
//                   }),
//               Navigator.pop(context)
//             },
//           ),
//           ListTile(
//             title: Text('Marker'),
//             onTap: () => {
//               setState(() {
//                   }),
//               Navigator.pop(context)
//             },
//           ),
//           ListTile(
//             title: Text('Location'),
//             onTap: () => {
//               setState(() {
//                     }),
//               Navigator.pop(context)
//             },
//           ),
//           ListTile(
//             title: Text('Rest Api Call'),
//             onTap: () => {
//               setState(() {
//                   }),
//               Navigator.pop(context)
//             },
//           ),
//           ListTile(
//             title: Text('Custom Widgets'),
//             onTap: () => {
//               setState(() {
//                          }),
//               Navigator.pop(context)
//             },
//           ),
//           ListTile(
//             title: Text('Polylines'),
//             onTap: () => {
//               setState(() {
//                     }),
//               Navigator.pop(context)
//             },
//           )
//         ],
//       ),
//     );
//   }
// }

























// // class MapDemoState extends State {
// //   static const String MAP_SDK_KEY = "";
// //   static const String REST_API_KEY = "";
// //   static const String ATLAS_CLIENT_ID = "";
// //   static const String ATLAS_CLIENT_SECRET = "";

//   FeatureType? selectedFeatureType;

//   // void setPermission() async {
//   //   if (!kIsWeb) {
//   //     final location = Location();
//   //     final hasPermissions = await location.hasPermission();
//   //     if (hasPermissions != PermissionStatus.granted) {
//   //       await location.requestPermission();
//   //     }
//   //   }
//   // }

//   // @override
//   // void initState() {
//   //   super.initState();

//   //   MapmyIndiaAccountManager.setMapSDKKey(MAP_SDK_KEY);
//   //   MapmyIndiaAccountManager.setRestAPIKey(REST_API_KEY);
//   //   MapmyIndiaAccountManager.setAtlasClientId(ATLAS_CLIENT_ID);
//   //   MapmyIndiaAccountManager.setAtlasClientSecret(ATLAS_CLIENT_SECRET);
//   //   setState(() {
//        // setPermission();
//   // }

  