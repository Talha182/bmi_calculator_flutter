import 'results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/Custom_Widgets.dart';
import 'package:bmi_calculator/constants.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColour;
  Color femaleCardColor = kInactiveCardColour;

  Gender? selectedGender = null;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          backgroundColor: Color.fromRGBO(10, 14, 33, 1),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        //Works like a button
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        child: ReusableCard(
                          colour: selectedGender == Gender.male
                              ? kActiveCardColour
                              : kInactiveCardColour,
                          cardChild: IconContent(
                            icon: FontAwesomeIcons.mars,
                            label: 'MALE',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        child: ReusableCard(
                            colour: selectedGender == Gender.female
                                ? kActiveCardColour
                                : kInactiveCardColour,
                            cardChild: IconContent(
                              icon: FontAwesomeIcons.venus,
                              label: 'FEMALE',
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Across the length of the row

                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: kTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(height.toString(), style: kNumberTextStyle),
                              Text(
                                'cm',
                                style: kTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Color(0xFF8D8E98),
                                thumbColor: Color(0xFFEB1555),
                                overlayColor: Color(0x15EB1555),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0)),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.toInt();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: kTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RawMaterialButton(
                                  constraints: BoxConstraints.tightFor(
                                      width: 56.0, height: 56.0),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      weight -= 1;
                                    });
                                  },
                                ),
                                SizedBox(width: 20.0),
                                RawMaterialButton(
                                  constraints: BoxConstraints.tightFor(
                                      width: 56.0, height: 56.0),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                  child: Icon(
                                    Icons.add,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      weight += 1;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Age',
                              style: kTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RawMaterialButton(
                                  constraints: BoxConstraints.tightFor(
                                      width: 56.0, height: 56.0),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      age -= 1;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                RawMaterialButton(
                                  constraints: BoxConstraints.tightFor(
                                      width: 56.0, height: 56.0),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                  child: Icon(
                                    Icons.add,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      age += 1;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BottomButtom(
                buttonTitle: 'CALCULATE',
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(weight: weight, height: height);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPage(
                                bmiResult: calc.calculateBMI(),
                                resultText: calc.getResult(),
                                interpretation: calc.getInterpretation(),
                              )));
                },
              )
            ]));
  }
}

// // 1 = male , 2 = female
// void updateColor(Gender selectedGender){
//   // Male  card was pressed
//   if(selectedGender == Gender.male){
//     if(maleCardColor == inactiveCardColour){
//       maleCardColor = activeCardColour;
//       femaleCardColor = inactiveCardColour;
//     }
//     else{
//       maleCardColor = inactiveCardColour;
//     }
//
//   }
//   // Female card pressed
//   if(selectedGender == Gender.female){
//     if(femaleCardColor == inactiveCardColour){
//       femaleCardColor = activeCardColour;
//       maleCardColor = inactiveCardColour;
//
//     }
//     else{
//       femaleCardColor = inactiveCardColour;
//     }
//   }
//
// }
