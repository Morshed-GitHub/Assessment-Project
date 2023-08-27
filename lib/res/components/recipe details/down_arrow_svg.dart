import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DownArrowSvg extends StatelessWidget {
  const DownArrowSvg({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/down_arrow.svg',
      color: const Color(0xff2A2A2A),
      height: height,
    );
  }
}
