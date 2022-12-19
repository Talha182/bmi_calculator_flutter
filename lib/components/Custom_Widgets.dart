import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

const kCalculateButton = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold
);

class IconContent extends StatelessWidget {

  IconContent({required this.icon,required this.label}){}

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),

        Text(label,
          style: kTextStyle
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {

  ReusableCard({required this.colour,required this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      height: 200.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour,       //Color.fromRGBO(29, 31, 59, 1),
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}



