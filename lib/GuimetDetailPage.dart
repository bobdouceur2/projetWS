import 'package:flutter/material.dart';
import 'main.dart';

class GuimetDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Musée Guimet"),
        backgroundColor: color2,
      ),
      body: Center(
        child: Text("Détails du Musée Guimet ici."),
      ),
    );
  }
}
