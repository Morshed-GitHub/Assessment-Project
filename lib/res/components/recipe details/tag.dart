import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class Tag extends StatelessWidget {
  final String tag;
  final bool isFinal;
  const Tag({
    Key? key,
    required this.tag,
    this.isFinal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = Utils.screenHeight;

    return Text(
      isFinal ? tag : '$tag, ',
      style: TextStyle(
        color: const Color(0xFF747D88),
        fontSize: height * .022,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
