import 'package:flutter/material.dart';
import 'main.dart';

class OrangerieDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Musée de l'Orangerie"),
        backgroundColor: color2,
      ),
      body: Center(
        child: Text("Détails du Musée de l'Orangerie ici."),
      ),
    );
  }
}