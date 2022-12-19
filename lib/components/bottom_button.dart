import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButtom extends StatelessWidget {
  BottomButtom({required this.buttonTitle, required this.onTap});
  final String buttonTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color.fromRGBO(215, 21, 85, 1),
        height: kButtomContianerHeight,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 5.0),
        margin: EdgeInsets.only(top: 10.0),
        child: Center(
          child: Text(buttonTitle,style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold
          ),
          ),
        ),
      ),
    );
  }
}