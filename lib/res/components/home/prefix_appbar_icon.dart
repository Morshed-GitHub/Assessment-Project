import 'package:flutter/material.dart';

class PrefixAppBarIcon extends StatelessWidget {
  final double height;
  const PrefixAppBarIcon({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(height * .05),
      child:
          Image.asset('assets/images/Menu.png', width: height, height: height),
    );
  }
}
