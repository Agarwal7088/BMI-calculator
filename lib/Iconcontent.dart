import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class Iconcontent extends StatelessWidget {
  const Iconcontent({super.key, this.ic, this.label});
  final IconData? ic;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(ic, size: 80),
        SizedBox(height: 15.0),
        Text(label!, style: labelTextStyle),
      ],
    );
  }
}
