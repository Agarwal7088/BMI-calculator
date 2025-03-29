import 'package:flutter/material.dart';

class Newreuseablecard extends StatelessWidget {
  const Newreuseablecard({
    super.key,
    this.colour,
    this.cardChild,
    this.onpress,
  });

  final Color? colour;
  final Function? onpress;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onpress;
      },
      child: Container(
        child: cardChild,
        height: 200,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
