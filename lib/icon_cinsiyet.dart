import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CinsiyetCard extends StatelessWidget {
  final String cinsiyet;
  final IconData icon;
  CinsiyetCard(
      {this.cinsiyet = "Default", this.icon = FontAwesomeIcons.airbnb});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60,
          color: Colors.black54,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          cinsiyet,
          style: TextStyle(fontSize: 20, color: Colors.black54),
        )
      ],
    );
  }
}