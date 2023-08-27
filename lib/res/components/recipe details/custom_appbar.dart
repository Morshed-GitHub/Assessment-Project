import 'package:assessment_project/res/components/recipe%20details/custom_search_bar.dart';
import 'package:assessment_project/res/components/recipe%20details/svg_menu_icon.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double height = Utils.screenHeight;
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(
          horizontal: height * .0125, vertical: height * .01),
      height: height * .12,
      width: Utils.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/Menu.png',
            width: height * .07,
            height: height * .07,
          ),
          const CustomSearchBar(),
          SvgMenuIcon(height: height),
        ],
      ),
    );
  }
}
