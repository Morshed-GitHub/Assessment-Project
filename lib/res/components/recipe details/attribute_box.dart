import 'package:flutter/material.dart';

import '../../../model/search_result_model.dart';
import '../../../utils/utils.dart';
import 'attribute.dart';
import 'attribute_type.dart';

class AttributeBox extends StatelessWidget {
  const AttributeBox({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final double height = Utils.screenHeight;
    final List<String>? healthLabelList = recipe.healthLabels;
    List<Widget> healthLabelWidgets = healthLabelList?.map((item) {
          return Attribute(title: item);
        }).toList() ??
        [];

    final List<String>? cuisineTypeList = recipe.cuisineType;
    List<Widget> cuisineTypeWidgetsList = cuisineTypeList?.map((item) {
          final String cuisineType = capitalizeFirstLetter(item);
          return Attribute(title: cuisineType);
        }).toList() ??
        [];

    return SizedBox(
      height: height * .2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AttributeType(height: height, title: "Health Labels"),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: healthLabelWidgets,
            ),
          ),
          AttributeType(height: height, title: "Cuisine Type"),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: cuisineTypeWidgetsList,
            ),
          ),
        ],
      ),
    );
  }

  String capitalizeFirstLetter(String word) {
    if (word.isEmpty) {
      return word;
    }
    return word[0].toUpperCase() + word.substring(1);
  }
}
