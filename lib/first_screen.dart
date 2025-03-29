import 'package:bmi_calculator/Iconcontent.dart';
import 'package:bmi_calculator/reuseablecard.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

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
                      overlayColor: Color(0xFFEB1555),
                      thumbColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
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
              Expanded(child: Newreuseablecard(colour: kactiveCardColor)),

              Expanded(child: Newreuseablecard(colour: kactiveCardColor)),
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
