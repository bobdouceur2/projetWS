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

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Musées-de-Paris.Stats',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: color2,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("interior-wood-Sony-museum-interior-design-estate-427325-wallhere.com.jpg"), // Remplacez par le chemin de votre image
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  "Musée du Louvre",
                  style: Theme.of(context).textTheme.headline5?.copyWith(color: color2),
                ),
                SizedBox(height: 20),
                AffluenceBarChart(),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: screenWidth > 800 ? 3 : 1,
                  childAspectRatio: 4,
                  children: <Widget>[
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
                    StatisticCard(
                      title: "Horaires d'ouverture détaillés",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HorairesLouvre()),
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
                  ],
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
      ),
    );
  }
}
