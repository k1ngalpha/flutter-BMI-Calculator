import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/main.dart';
import 'constants.dart';
import 'calculator_main.dart';
import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';

//enums for gender
enum Gender { male, female, unspecified }

int height = 180;
int weight = 60;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColor = suspendedSession;
  // Color femaleCardColor = suspendedSession;
  late Gender selectedGender = Gender.unspecified;

  //1 - male 2 - female
  // void updateColor(Gender gender) {
  //   //male card
  //   if (gender == Gender.male) {
  //     if (maleCardColor == suspendedSession) {
  //       maleCardColor = activeSession;
  //       femaleCardColor = suspendedSession;
  //     } else {
  //       maleCardColor = suspendedSession;
  //     }
  //   }
  //   if (gender == Gender.female) {
  //     if (femaleCardColor == suspendedSession) {
  //       femaleCardColor = activeSession;
  //       maleCardColor = suspendedSession;
  //     } else {
  //       femaleCardColor = suspendedSession;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KSuspendedSession,
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  onpress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveSession
                      : KSuspendedSession,
                  cardChild: (IconContents(
                    icons: FontAwesomeIcons.mars,
                    label: 'MALE',
                  )),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onpress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveSession
                      : KSuspendedSession,
                  cardChild: IconContents(
                    icons: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveSession,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //To make the cm and 180 at the same line
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0XFFF8D8E98),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0X15EB1555),
                      thumbColor: Color(0XFFEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      //activeColor: Color(0XFFEB1555),

                      min: 120,
                      max: 220,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  colour: Color(0XFF1D1E33),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      ),
                    ],
                  ),
                  colour: Color(0XFF1D1E33),
                ),
              ),
            ]),
          ),
          ButtomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorMain calc =
                  CalculatorMain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterretation(),
                );
              }));
            },
          ),
        ],
      ),
    );
  }
}
