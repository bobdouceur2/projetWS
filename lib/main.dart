import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// Définition des couleurs de la palette
const Color color1 = Color(0xFFE7ECEF);
const Color color2 = Color(0xFF274C77);
const Color color3 = Color(0xFF6096BA);
const Color color4 = Color(0xFFA3CEF1);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tableau de Bord - Musées de Paris',
      theme: ThemeData(
        primaryColor: color2,
        scaffoldBackgroundColor: color1,
        fontFamily: 'Arial',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

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
                    MaterialPageRoute(builder: (context) => ArtworksDetailPage()),
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
    );
  }
}

class StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;
  final Color color;

  const StatisticCard({Key? key, required this.title, required this.value, required this.onTap, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: color,
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          title: Text(title, style: TextStyle(fontSize: 18, color: color2)),
          trailing: Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color3)),
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String title;
  final BuildContext context;
  final Widget destinationPage;

  const DashboardButton({Key? key, required this.title, required this.context, required this.destinationPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
      foregroundColor: color1,
      backgroundColor: color2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(vertical: 15),
    ),
    onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destinationPage),
    );
    },
        child: Text(title),
      ),
    );
  }
}

class VisitorDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Détails des visiteurs"),
        backgroundColor: color2,
      ),
      body: Center(
        child: Text("Plus d'informations sur les visiteurs ici."),
      ),
    );
  }
}

class ArtworksDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Détails des œuvres"),
        backgroundColor: color2,
      ),
      body: Center(
        child: Text("Plus d'informations sur les œuvres ici."),
      ),
    );
  }
}

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

class AffluenceBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: BarChart(
        BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (context, value) => TextStyle(color: color2, fontWeight: FontWeight.bold, fontSize: 14),
            margin: 10,
            getTitles: (double value) {
              switch (value.toInt()) {
                case 0:
                  return '10h';
                case 1:
                  return '11h';
                case 2:
                  return '12h';
                case 3:
                  return '13h';
                case 4:
                  return '14h';
                case 5:
                  return '15h';
                case 6:
                  return '16h';
                default:
                  return '';
              }
            },
          ),
          leftTitles: SideTitles(showTitles: false),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
        BarChartGroupData(x: 0, barRods: [BarChartRodData(y: 8, colors: [color3], width: 15)]),
    BarChartGroupData(x: 1, barRods: [BarChartRodData(y: 10, colors: [color3], width: 15)]),
    BarChartGroupData(x: 2, barRods: [BarChartRodData(y: 14, colors: [color3], width: 15)]),
    BarChartGroupData(x: 3, barRods: [BarChartRodData(y: 15, colors: [color3], width: 15)]),
    BarChartGroupData(x: 4, barRods: [BarChartRodData(y: 13, colors: [color3], width: 15)]),
          BarChartGroupData(x: 5, barRods: [BarChartRodData(y: 10, colors: [color3], width: 15)]),
          BarChartGroupData(x: 6, barRods: [BarChartRodData(y: 5, colors: [color3], width: 15)]),
        ],
        ),
        ),
    );
  }
}



