import 'package:flutter/material.dart';

class Newreuseablecard extends StatelessWidget {
  const Newreuseablecard({super.key, this.colour, this.cardChild});

  final Color? colour;

  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.all(15),
      child: cardChild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
