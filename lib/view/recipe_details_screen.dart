// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:assessment_project/model/search_result_model.dart';
import 'package:assessment_project/utils/utils.dart';

import '../res/components/recipe details/attribute_box.dart';
import '../res/components/recipe details/category.dart';
import '../res/components/recipe details/custom_appbar.dart';
import '../res/components/recipe details/down_arrow_svg.dart';
import '../res/components/recipe details/fat_categories.dart';
import '../res/components/recipe details/food_menu.dart';
import '../res/components/recipe details/nutrients.dart';
import '../res/components/recipe details/nutrition_divider.dart';
import '../res/components/recipe details/rectangle_action_button.dart';
import '../res/components/recipe details/tag.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailsScreen({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(recipe.image.toString());
    final double height = Utils.screenHeight;

    List<String>? healthLabels = recipe
        .healthLabels; // Assuming healthLabels is the list you received from the API

    List<Widget> tagWidgets = healthLabels?.map((tag) {
          bool isFinal =
              tag == healthLabels.last; // Set isFinal to true for the last item
          return isFinal ? Tag(tag: tag, isFinal: isFinal) : Tag(tag: tag);
        }).toList() ??
        [];

    return Scaffold(
      body: Stack(
        // Upper Stack -> CustomAppbar
        children: [
          SingleChildScrollView(
            child: Stack(
              // Lower Stack -> Right side vector & image
              children: [
                Positioned(
                  top: 0, // Position from the top
                  right: 0, // Position from the right
                  child: Image.asset(
                    "assets/images/Vector.png",
                    height: height * .34,
                    width: height * .21,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: height * .16, // Position from the top
                  right: height * .02, // Position from the right
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(height * .03),
                    child: Image.network(
                      recipe.image.toString(),
                      width: height * .2,
                      height: height * .2,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: height * .03),
                  margin: EdgeInsets.only(top: height * .12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FoodMenu(
                          height: height,
                          lightText: "REFINE SEARCH BY",
                          boldText: "Calories, Diet, Ingredients"),
                      SizedBox(height: height * .05),
                      pageTitle(recipe.label.toString(), height),
                      SizedBox(height: height * .01),
                      seeFullRecipeOn(height),
                      SizedBox(height: height * .02),
                      Row(
                        children: [
                          RectangleActionButton(
                              height: height, svg: "rectangle_plus"),
                          SizedBox(width: height * .015),
                          RectangleActionButton(
                              height: height, svg: "mdi_share"),
                        ],
                      ),
                      SizedBox(height: height * .01),
                      AttributeBox(recipe: recipe),
                      SizedBox(height: height * .01),

                      Category(type: "Preparation"),
                      SizedBox(height: height * .02),
                      FoodMenu(
                          height: height,
                          lightText: "Instructions on",
                          boldText: recipe.source.toString()),
                      Category(type: "Nutrition"),
                      SizedBox(height: height * .02),
                      nutritionBox(height),
                      SizedBox(height: height * .02),
                      Category(type: "Tags"),
                      SizedBox(height: height * .02),
                      Wrap(
                        // In order to place tag's on the next line when crossing line
                        spacing: 4, // Horizontal spacing between tags
                        runSpacing: 2, // Vertical spacing between lines
                        children: tagWidgets,
                      ),
                      SizedBox(height: height * .02),
                      Category(type: "Nutrition"),
                      SizedBox(height: height * .02),

                      // On Process
                      NutritionDetailBox(recipe: recipe),
                      SizedBox(height: height * .02),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomAppBar(),
          ),
        ],
      ),
    );
  }

  SizedBox pageTitle(String title, double height) {
    return SizedBox(
      width: height * .25,
      child: Text(
        title,
        // 'Wok-Fried Duck & Oyster Sauce',
        style: TextStyle(
          color: Color(0xFF3C444C),
          fontSize: height * 0.026,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          height: 1.07,
        ),
      ),
    );
  }

  Text seeFullRecipeOn(double height) {
    final double fontSize = height * 0.022;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'See full recipe on: \n',
            style: TextStyle(
              color: Color(0xFF3C444C),
              fontSize: fontSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 1.30,
            ),
          ),
          TextSpan(
            text: recipe.source.toString(),
            style: TextStyle(
              color: Color(0xFF3C444C),
              fontSize: fontSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              height: 1.30,
            ),
          ),
        ],
      ),
    );
  }

  Container nutritionBox(double height) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Color(0xFF7DEF02),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(height * .04),
            bottomLeft: Radius.circular(height * .04),
            bottomRight: Radius.circular(height * .04),
          ),
        ),
      ),
      child: nutritionRow(height),
    );
  }

  Row nutritionRow(double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Nutritions(height: height, type: "CAL / SERV", value: "146"),
        NutritionDivider(height: height),
        Nutritions(
            height: height,
            type: "DAILY VALUE",
            value: "7",
            isPercentage: true),
        NutritionDivider(height: height),
        Nutritions(
            height: height, type: "SERVINGS", value: "8", isPercentage: true),
      ],
    );
  }
}

class NutritionDetailBox extends StatelessWidget {
  const NutritionDetailBox({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final double height = Utils.screenHeight;
    final totalNutrients = recipe.totalNutrients!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: height * .036, vertical: height * .0125),
      decoration: ShapeDecoration(
        color: Color(0xFF7DEF02),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(height * .04),
            bottomLeft: Radius.circular(height * .04),
            bottomRight: Radius.circular(height * .04),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          fatTypeRow(height, totalNutrients),
          totalAmount(height, totalNutrients),
        ],
      ),
    );
  }

  Column totalAmount(double height, TotalNutrients totalNutrients) {
    return Column(
      children: [
        Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Column(
                  children: [
                    FatCategories(
                      title: "Total Amount",
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: height * .003,
                decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.6000000238418579),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(height * .01),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FatCategories(
                  title:
                      "${totalNutrients.fAT!.quantity!.toInt().toString()} ${totalNutrients.fAT!.unit.toString()}",
                ),
                FatCategories(
                  title:
                      "${totalNutrients.cHOLE!.quantity!.toInt().toString()} ${totalNutrients.cHOLE!.unit.toString()}",
                ),
                FatCategories(
                  title:
                      "${totalNutrients.eNERCKCAL!.quantity!.toInt().toString()} ${totalNutrients.eNERCKCAL!.unit.toString()}",
                ),
                FatCategories(
                  title:
                      "${totalNutrients.fAMS!.quantity!.toInt().toString()} ${totalNutrients.fAMS!.unit.toString()}",
                ),
                FatCategories(
                  title:
                      "${totalNutrients.fAPU!.quantity!.toInt().toString()} ${totalNutrients.fAPU!.unit.toString()}",
                ),
                FatCategories(
                  title:
                      "${totalNutrients.fATRN!.quantity!.toInt().toString()} ${totalNutrients.fATRN!.unit.toString()}",
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Row fatTypeRow(double height, TotalNutrients totalNutrients) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fat',
          style: TextStyle(
            color: Color(0xFF0F0F0F),
            fontSize: height * .02,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DownArrowSvg(height: height * .026),
            FatCategories(
              title: totalNutrients.fAT!.label.toString(),
            ),
            FatCategories(
              title: totalNutrients.cHOLE!.label.toString(),
            ),
            FatCategories(
              title: totalNutrients.eNERCKCAL!.label.toString(),
            ),
            FatCategories(
              title: totalNutrients.fAMS!.label.toString(),
            ),
            FatCategories(
              title: totalNutrients.fAPU!.label.toString(),
            ),
            FatCategories(
              title: totalNutrients.fATRN!.label.toString(),
            ),
          ],
        ),
      ],
    );
  }
}
