import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgMenuIcon extends StatelessWidget {
  const SvgMenuIcon({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(height * .01),
      child: SvgPicture.asset(
        'assets/svg/Menu.svg',
        color: const Color(0xff2A2A2A),
        height: height * .06,
      ),
    );
  }
}
