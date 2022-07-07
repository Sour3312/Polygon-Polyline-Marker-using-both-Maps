// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_polygon/current_loc.dart';
import 'package:flutter_polygon/geocode.dart';
import 'package:flutter_polygon/polygon.dart';
import 'package:flutter_polygon/polyline.dart';
import 'package:flutter_polygon/symbol.dart';

import 'home.dart';
import 'mapclick.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      home: GeocodeWidget(),
      // home: SymbolFlutter(),
      // home: PolygonFlutter(),
      // home: MapClickEvent(),
      // home: CurrentLocationWidget(),
      // home: AddPolylineWidget(),
    );
  }
}
