import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class Category extends StatelessWidget {
  const Category({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    final double height = Utils.screenHeight;

    return Stack(
      children: [
        Text(
          type,
          style: TextStyle(
              fontSize: height * 0.027,
              color: const Color(0xff3C444C),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: height * .003,
            decoration: ShapeDecoration(
              color: const Color(0x99FEC915),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(height * .01),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
