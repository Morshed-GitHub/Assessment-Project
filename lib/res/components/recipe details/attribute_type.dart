import 'package:flutter/material.dart';

class AttributeType extends StatelessWidget {
  final double height;
  final String title;
  const AttributeType({
    Key? key,
    required this.height,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
      child: Text(
        "$title:",
        style: TextStyle(
          color: const Color(0xFFCBCFD4),
          fontSize: height * 0.025,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
