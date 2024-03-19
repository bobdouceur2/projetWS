import 'dart:ui';

import 'package:flutter/material.dart';

import 'main.dart';

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