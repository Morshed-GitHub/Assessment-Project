import 'package:flutter/material.dart';

import 'down_arrow_svg.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({
    Key? key,
    required this.height,
    required this.lightText,
    required this.boldText,
  }) : super(key: key);

  final double height;
  final String lightText;
  final String boldText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$lightText ',
                style: TextStyle(
                  fontSize: height * 0.016,
                  color: const Color(0xFF747D88),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
              TextSpan(
                text: boldText,
                style: TextStyle(
                  fontSize: height * 0.016,
                  color: const Color(0xFF747D88),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        DownArrowSvg(height: height * .026),
      ],
    );
  }
}
