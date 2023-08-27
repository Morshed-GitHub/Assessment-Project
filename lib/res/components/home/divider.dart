import 'package:flutter/material.dart';

class CalIngrDivider extends StatelessWidget {
  const CalIngrDivider({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: height * 0.01),
      height: height * 0.028,
      width: height * .0015,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(height * 0.03)),
    );
  }
}
