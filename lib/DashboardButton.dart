import 'package:flutter/material.dart';
import 'main.dart';

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