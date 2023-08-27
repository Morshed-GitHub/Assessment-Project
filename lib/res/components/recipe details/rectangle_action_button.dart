import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RectangleActionButton extends StatelessWidget {
  final double height;
  final String svg;
  const RectangleActionButton({
    Key? key,
    required this.height,
    required this.svg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double pad = (svg == "rectangle_plus") ? .006 : .004;
    return Container(
      width: height * .05,
      height: height * .05,
      padding: EdgeInsets.all(height * pad),
      decoration: ShapeDecoration(
        color: const Color(0xFF7DEF02),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height * .015)),
      ),
      child: SvgPicture.asset(
        'assets/svg/$svg.svg',
        color: const Color(0xff2A2A2A),
      ),
    );
  }
}
