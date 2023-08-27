import 'package:flutter/material.dart';

class GreyStraightLine extends StatelessWidget {
  final double height;
  const GreyStraightLine({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height, // Adjust this for the line thickness
      color: Colors.grey.withOpacity(0.7), // Slightly grey color
    );
  }
}
