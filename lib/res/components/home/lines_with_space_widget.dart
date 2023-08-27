import 'package:flutter/material.dart';

import 'grey_straight_line.dart';

class LinesWithSpaceWidget extends StatelessWidget {
  final double height;
  const LinesWithSpaceWidget({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GreyStraightLine(height: height * .012),
        SizedBox(height: height * .8), // Spacing between lines
        GreyStraightLine(height: height * .012),
      ],
    );
  }
}
