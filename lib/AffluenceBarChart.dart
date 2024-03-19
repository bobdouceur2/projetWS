import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class AffluenceBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0), // Réduit l'espacement avec le graphique
          child: Text(
            "Affluence en fonction de l'heure aujourd'hui",
            style: TextStyle(
              fontSize: 19, // Taille de police réduite
              fontWeight: FontWeight.bold,
              color: Colors.black, // Ajustez la couleur selon votre thème
            ),
          ),
        ),
        Container(
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
                topTitles: SideTitles(showTitles: false),
                rightTitles: SideTitles(showTitles: false),
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
        ),
      ],
    );
  }
}
