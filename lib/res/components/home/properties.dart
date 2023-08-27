import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class Properties extends StatelessWidget {
  final String count;
  final String type;
  const Properties({
    super.key,
    required this.count,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final double height = Utils.screenHeight;

    return Baseline(
      // Baseline part here is only used to attach the children's to the end of the vertical part (Bottom)
      baselineType: TextBaseline.alphabetic,
      baseline: 0.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        mainAxisAlignment:
            (type == "INGR") ? MainAxisAlignment.end : MainAxisAlignment.end,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            '$count ',
            style: TextStyle(
              fontSize: height * 0.02,
              color: Colors.green, // Grass color for numbers
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            type,
            style: TextStyle(
              fontSize: height * 0.018,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
