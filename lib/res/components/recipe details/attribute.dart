import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class Attribute extends StatelessWidget {
  final String title;
  const Attribute({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = Utils.screenHeight;

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: height * .012),
      padding: EdgeInsets.only(left: height * .015, right: height * .015),
      decoration: ShapeDecoration(
        color: const Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height * .03)),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: const Color(0xFF3C444C),
          fontSize: height * .02,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
