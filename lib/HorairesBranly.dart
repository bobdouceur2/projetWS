import 'package:flutter/material.dart';

class HorairesBranly extends StatelessWidget {
  final List<Map<String, dynamic>> horaires = [
    {"jour": "Mardi", "heures": "10h30 - 19h"},
    {"jour": "Mercredi", "heures": "10h30 - 19h"},
    {"jour": "Jeudi", "heures": "10h30 - 19h"},
    {"jour": "Vendredi", "heures": "10h30 - 21h"},
    {"jour": "Samedi", "heures": "10h30 - 19h"},
    {"jour": "Dimanche", "heures": "10h30 - 19h"},
    // Notez que le musée est fermé le lundi
  ];

  // Définition des nouvelles couleurs
  final Color color1 = Color(0xFF2B2D42);
  final Color color2 = Color(0xFF8D99AE);
  final Color color3 = Color(0xFFEDF2F4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Horaires d\'ouverture détaillés - Musée du Quai Branly',
          style: TextStyle(color: color3),
        ),
        backgroundColor: color1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: horaires.length,
          itemBuilder: (context, index) {
            return Card(
              color: color2,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                title: Text(
                  horaires[index]["jour"],
                  style: TextStyle(fontWeight: FontWeight.bold, color: color1),
                ),
                subtitle: Text(
                  horaires[index]["heures"],
                  style: TextStyle(color: color1),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
