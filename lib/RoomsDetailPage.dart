import 'package:flutter/material.dart';
import 'main.dart';

class RoomsDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Détails des salles"),
        backgroundColor: color2,
      ),
      body: Center(
        child: Text("Plus d'informations sur les salles ici."),
      ),
    );
  }
}