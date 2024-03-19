import 'package:flutter/material.dart';

class HorairesLouvre extends StatelessWidget {
  final List<Map<String, dynamic>> horaires = [
    {"jour": "Lundi", "heures": "9h - 18h"},
    {"jour": "Mercredi", "heures": "9h - 18h"},
    {"jour": "Vendredi", "heures": "9h - 21h45 (nocturne)"},
    // Ajoutez d'autres jours et horaires ici
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
          'Horaires d\'ouverture détaillés',
          style: TextStyle(color: color3), // Utilisation de color3 pour le texte de l'AppBar
        ),
        backgroundColor: color1, // Utilisation de color1 pour le fond de l'AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: horaires.length,
          itemBuilder: (context, index) {
            return Card(
              color: color2, // Utilisation de color2 pour le fond des cartes
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                leading: Icon(Icons.access_time, color: color1), // Utilisation de color1 pour l'icône
                title: Text(
                  horaires[index]["jour"],
                  style: TextStyle(fontWeight: FontWeight.bold, color: color1), // Utilisation de color1 pour le texte du jour
                ),
                subtitle: Text(
                  horaires[index]["heures"],
                  style: TextStyle(color: color1), // Utilisation de color1 pour le texte des heures
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
