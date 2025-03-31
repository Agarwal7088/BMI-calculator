import 'package:bmi_calculator/Iconcontent.dart';
import 'package:bmi_calculator/botton_botton.dart';
import 'package:bmi_calculator/calculate_brain.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/reuseablecard.dart';
import 'package:bmi_calculator/roundiconbutton.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
//port 'calculate_brain.dart';

// const inactiveCardColor = Color(0xFF111328);
// const activeCardColor = Color(0xFF1D1E33);

enum Gender { male, female }

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key, required String title});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

Gender? selectedGender;
int height = 180;
int weight = 60;
int age = 20;
// Color malecardColour = activeCardColor;
// Color femalecardColour = activeCardColor;

// void updateColour(Gender selectedGender) {
//   if (selectedGender == Gender.male) {
//     if (malecardColour == inactiveCardColor) {
//       malecardColour = activeCardColor;
//       femalecardColour = inactiveCardColor;
//     } else {
//       malecardColour = inactiveCardColor;
//     }
//   }
//   //female card pressed
//   if (selectedGender == Gender.female) {
//     if (femalecardColour == inactiveCardColor) {
//       femalecardColour = activeCardColor;
//     } else {
//       femalecardColour = inactiveCardColor;
//     }
//   }
// }

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    //current state of our app how our app appearing as it is
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("BMI CALCULATOR"))),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Newreuseablecard(
                  onpress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  //colour: malecardColour,
                  colour:
                      selectedGender == Gender.male
                          ? kactiveCardColor
                          : kinactiveCardColor,
                  cardChild: Iconcontent(label: "FEMALE", ic: Icons.female),
                ),
              ),

              Expanded(
                child: Newreuseablecard(
                  onpress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour:
                      selectedGender == Gender.female
                          ? kactiveCardColor
                          : kinactiveCardColor,
                  cardChild: Iconcontent(label: "MALE", ic: Icons.male),
                ),
              ),
            ],
          ),
          Expanded(
            child: Newreuseablecard(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: labelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text('cm', style: labelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0xFFEB1555),
                      thumbColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,

                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          Row(
            children: [
              Expanded(
                child: Newreuseablecard(
                  colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: labelTextStyle),
                      Text(weight.toString(), style: labelTextStyle),
                      Row(
                        children: [
                          RoundIconButton(
                            icon: Icons.add,
                            onpress: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),

                          SizedBox(width: 10),
                          RoundIconButton(
                            icon: IconData(0xF70F),
                            onpress: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: Newreuseablecard(
                  colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE', style: labelTextStyle),
                      Text(age.toString(), style: labelTextStyle),
                      Row(
                        children: [
                          RoundIconButton(
                            icon: Icons.add,
                            onpress: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),

                          SizedBox(width: 10),
                          RoundIconButton(
                            icon: IconData(0xF70F),
                            onpress: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          BottomButton(
            onTap: () {
              CalculateBrain calc = CalculateBrain(
                height: height,
                weight: weight,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        interpretation: calc.getInterpretation(),
                        resultText: calc.getResult(),
                      ),
                ),
              );
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
