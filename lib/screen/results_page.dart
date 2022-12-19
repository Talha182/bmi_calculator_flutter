import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/Custom_Widgets.dart';
import 'package:bmi_calculator/components/bottom_button.dart';


class ResultsPage extends StatelessWidget {

  ResultsPage ({required this.interpretation , required this.bmiResult, required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch  ,
        children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.all(30.0),
            alignment: Alignment.centerLeft,
            child: Text('YOUR RESULT',
              style: kTitleTextStyle,
            ),
          )
          ),
          Expanded(
            flex: 5,

            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(),
                  style: kResultsTextStyle,
                  ),
                  Text(bmiResult,
                  style: kBmiTextStyle,
                  ),
                  Text(interpretation,
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,
                  ),

                ],

              ),
            ),

          ),

        BottomButtom(buttonTitle: 'RE-CALCULATE',
        onTap: (){
          Navigator.pop(context);
        }
          ,)
        ],
      )


    );
  }
}
