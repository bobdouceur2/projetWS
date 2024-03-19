import 'package:flutter/material.dart';

class StatisticCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;

  const StatisticCard({Key? key, required this.title, required this.onTap, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: color,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          width: double.infinity, // Assurez-vous que le conteneur prend toute la largeur disponible
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centre le contenu verticalement
            crossAxisAlignment: CrossAxisAlignment.center, // Centre le contenu horizontalement
            children: [
              Text(
                title,
                textAlign: TextAlign.center, // Assure le centrage du texte
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black, // Adaptez la couleur selon votre thème
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
