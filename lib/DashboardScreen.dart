import 'package:flutter/material.dart';
import 'AffluenceBarChart.dart';
import 'ArtworksGalleryPage.dart';
import 'DashboardButton.dart';
import 'GuimetDetailPage.dart';
import 'OrangerieDetailPage.dart';
import 'QuaiBranlyDetailPage.dart';
import 'RoomsDetailPage.dart';
import 'StatisticCard.dart';
import 'VisitorDetailPage.dart';
import 'main.dart';


class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Musées-de-Paris.Stats'),
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
                "Musée du Louvres",
                style: Theme.of(context).textTheme.headline5?.copyWith(color: color2),
              ),
              SizedBox(height: 20),
              AffluenceBarChart(),
              StatisticCard(
                title: "Nombre de visiteurs aujourd'hui",
                value: "2,300",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VisitorDetailPage()),
                  );
                },
                color: color4,
              ),
              StatisticCard(
                title: "Nombre d'œuvres",
                value: "35 000",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ArtworksGalleryPage()),
                  );
                },
                color: color4,
              ),
              StatisticCard(
                title: "Nombre de salles",
                value: "380",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RoomsDetailPage()),
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
              DashboardButton(title: 'Musée du Quai Branly', context: context, destinationPage: QuaiBranlyDetailPage()),
              DashboardButton(title: "Musée de l'Orangerie", context: context, destinationPage: OrangerieDetailPage()),
              DashboardButton(title: 'Musée Guimet', context: context, destinationPage: GuimetDetailPage()),
            ],
          ),
        ),
      ),
    );}}