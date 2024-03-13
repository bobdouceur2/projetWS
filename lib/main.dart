import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tableau de Bord - Musées de Paris',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
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
        backgroundColor: Colors.blueGrey,
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
                style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black54),
              ),
              SizedBox(height: 20),
              AffluenceBarChart(),
              StatisticCard(title: "Nombre de visiteurs en 2023", value: "9,7 millions"),
              StatisticCard(title: "Nombre d'œuvres", value: "35 000"),
              StatisticCard(title: "Nombre de salles", value: "380"),
              SizedBox(height: 20),
              Text(
                "Explorer d'autres musées",
                style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black54),
              ),
              SizedBox(height: 10),
              DashboardButton(title: 'Musée du Quai Branly', context: context),
              DashboardButton(title: "Musée de l'Orangerie", context: context),
              DashboardButton(title: 'Musée Guimet', context: context),
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

  const StatisticCard({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        title: Text(title, style: TextStyle(fontSize: 18)),
        trailing: Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String title;
  final BuildContext context;

  const DashboardButton({Key? key, required this.title, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blueGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: () {
          // Implémentez la navigation vers les écrans correspondants
        },
        child: Text(title),
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
              getTextStyles: (context, value) => const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
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
            BarChartGroupData(x: 0, barRods: [BarChartRodData(y: 8, width: 15)]),
            BarChartGroupData(x: 1, barRods: [BarChartRodData(y: 10, width: 15)]),
            BarChartGroupData(x: 2, barRods: [BarChartRodData(y: 14, width: 15)]),
            BarChartGroupData(x: 3, barRods: [BarChartRodData(y: 15, width: 15)]),
            BarChartGroupData(x: 4, barRods: [BarChartRodData(y: 13, width: 15)]),
            BarChartGroupData(x: 5, barRods: [BarChartRodData(y: 10, width: 15)]),
            BarChartGroupData(x: 6, barRods: [BarChartRodData(y: 5, width: 15)]),
          ],
        ),
      ),
    );
  }
}
