import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    @required this.onTap,
    @required this.buttonTitle,
  });

  final VoidCallback? onTap;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 0,
        child: Center(child: Text(buttonTitle!, style: klargeButtonTexttyle)),
        width: double.infinity,
        height: 80.0,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          //color: colour,
          color: Color(0xFFEB1555),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
