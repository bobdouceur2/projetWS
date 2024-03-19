import 'package:flutter/material.dart';

import 'main.dart';

class QuaiBranlyDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Musée du Quai Branly"),
        backgroundColor: color2,
      ),
      body: Center(
        child: Text("Détails du Musée du Quai Branly ici."),
      ),
    );
  }
}