import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class FatCategories extends StatelessWidget {
  final String title;

  const FatCategories({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = Utils.screenHeight;

    return Text(
      title,
      style: TextStyle(
        color: const Color(0xFF3A3A3A),
        fontSize: height * .0175,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
