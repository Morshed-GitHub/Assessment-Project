import 'package:flutter/material.dart';

class PostfixAppBarIcon extends StatelessWidget {
  final double height;
  const PostfixAppBarIcon({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu, size: height * .1),
      onPressed: () {
        // Add your action here
      },
    );
  }
}
