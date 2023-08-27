import 'package:flutter/material.dart';

class GridItemTextSection extends StatelessWidget {
  final double height;
  final String title;
  final bool isSource;

  const GridItemTextSection(this.title,
      {Key? key, required this.height, this.isSource = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.white,
          fontSize: isSource ? height * .8 : height,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.visible),
    );
  }
}
