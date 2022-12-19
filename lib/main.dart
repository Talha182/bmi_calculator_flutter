import 'package:flutter/material.dart';
import 'screen/input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(   // Changing things from the dark theme
        scaffoldBackgroundColor: Color.fromRGBO(10, 14,33, 1),
      ),
      home: InputPage(),
    );
  }
}





















