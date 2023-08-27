import 'package:flutter/material.dart';

class Nutritions extends StatelessWidget {
  const Nutritions({
    Key? key,
    required this.height,
    required this.type,
    required this.value,
    this.isPercentage = false,
  }) : super(key: key);

  final double height;
  final String type;
  final String value;
  final bool isPercentage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: height * .02, vertical: height * .025),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            height: height * .048,
            width: height * .085,
            margin: EdgeInsets.only(bottom: height * .025),
            // padding: EdgeInsets.symmetric(
            //     horizontal: height * .015, vertical: height * .008),
            decoration: ShapeDecoration(
              color: const Color(0xFFD9D9D9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(height * .01)),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 3),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Text(
              isPercentage ? "$value%" : value,
              style: TextStyle(
                color: const Color(0xFF3C444C),
                fontSize: height * .023,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            type,
            style: TextStyle(
              color: const Color(0xFF3C444C),
              fontSize: height * .018,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
