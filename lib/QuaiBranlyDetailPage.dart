import 'package:fdgcthvjk/DashboardScreen.dart';
import 'package:fdgcthvjk/HorairesBranly.dart';
import 'package:flutter/material.dart';
import 'AffluenceBarChart.dart';
import 'ArtworksLouvres.dart';
import 'DashboardButton.dart';
import 'GuimetDetailPage.dart';
import 'OrangerieDetailPage.dart';
import 'QuaiBranlyDetailPage.dart';
import 'PrixTicketsLouvre.dart';
import 'StatisticCard.dart';
import 'HorairesLouvre.dart';
import 'main.dart';

class QuaiBranlyDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Musées-de-Paris.Stats',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: color2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                "Musée du Quai Branly",
                style: Theme.of(context).textTheme.headline5?.copyWith(color: color2),
              ),
              SizedBox(height: 20),
              AffluenceBarChart(),
              // Bouton "Aperçu des œuvres exposées" en premier
              StatisticCard(
                title: "Aperçu des œuvres exposées",


                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ArtworksLouvres()),
                  );
                },
                color: color4,
              ),
              // Bouton "Nombre de visiteurs aujourd'hui" déplacé en deuxième position
              StatisticCard(
                title: "Horaires d'ouverture détaillés",

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HorairesBranly()),
                  );
                },
                color: color4,
              ),
              StatisticCard(
                title: "Prix des Tickets",

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrixTicketLouvre()),
                  );
                },
                color: color4,
              ),
              SizedBox(height: 20),
              Text(
                "Explorer d'autres musées",
                style: Theme.of(context).textTheme.headline6?.copyWith(color: color2),
              ),
              SizedBox(height: 10),
              DashboardButton(title: 'Musée du Louvre', context: context, destinationPage: DashboardScreen()),
              DashboardButton(title: "Musée de l'Orangerie", context: context, destinationPage: OrangerieDetailPage()),
              DashboardButton(title: 'Musée Guimet', context: context, destinationPage: GuimetDetailPage()),
            ],
          ),
        ),
      ),
    );
  }
}
