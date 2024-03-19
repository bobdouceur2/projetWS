import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'DashboardScreen.dart';


// Définition des couleurs de la palette
const Color color1 = Color(0xFFE7ECEF);
const Color color2 = Color(0xFF274C77);
const Color color3 = Color(0xFF6096BA);
const Color color4 = Color(0xFFA3CEF1);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tableau de Bord - Musées de Paris',
      theme: ThemeData(
        primaryColor: color2,
        scaffoldBackgroundColor: color1,
        fontFamily: 'arial',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}





  Future<List> loadJsonData() async {
    final jsonData = await rootBundle.loadString('assets/ImageLinks.json');
    final Map<String, dynamic> imagesData = json.decode(jsonData);
    final List imageUrls = imagesData.values.toList();
    return imageUrls;
  }







