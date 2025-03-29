import 'package:bmi_calculator/Iconcontent.dart';
import 'package:bmi_calculator/reuseablecard.dart';
import 'package:flutter/material.dart';

const inactiveCardColor = Color(0xFF111328);
const activeCardColor = Color(0xFF1D1E33);

enum Gender { male, female }

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key, required String title});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

Gender? selectedGender;
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
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("BMI CALCULATOR"))),

      body: Column(
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
                          ? activeCardColor
                          : inactiveCardColor,
                  cardChild: Iconcontent(label: "FEMALE"),
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
                          ? activeCardColor
                          : inactiveCardColor,
                  cardChild: Iconcontent(label: "MALE"),
                ),
              ),
            ],
          ),
          Expanded(child: Newreuseablecard()),

          Row(
            children: [
              Expanded(child: Newreuseablecard()),

              Expanded(child: Newreuseablecard()),
            ],
          ),
          Expanded(
            child: Container(
              // height: 0,
              width: double.infinity,
              height: 80.0,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                //color: colour,
                color: Color(0xFFEB1555),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
