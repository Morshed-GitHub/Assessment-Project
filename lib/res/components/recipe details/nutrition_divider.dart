import 'package:flutter/material.dart';

class NutritionDivider extends StatelessWidget {
  const NutritionDivider({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height * .003,
      height: height * .08,
      decoration: ShapeDecoration(
        color: const Color(0xFF3C444C),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height * .05)),
      ),
    );
  }
}
