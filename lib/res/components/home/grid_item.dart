import 'package:assessment_project/res/components/home/divider.dart';
import 'package:flutter/material.dart';

import '../../../model/search_result_model.dart';
import '../../../utils/utils.dart';
import '../../../view/recipe_details_screen.dart';
import 'grid_item_text_seciton.dart';
import 'properties.dart';

class GridItem extends StatelessWidget {
  final Recipe recipe;

  const GridItem({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = Utils.screenHeight;

    return InkWell(
      onTap: () {
        pushToRecipeDetailScreen(context);
      },
      // Outlined Box
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        padding: EdgeInsets.all(height * .01),
        child: Column(
          children: [
            // Image Part
            Stack(
              children: [
                Image.network(
                  recipe.image.toString(),
                  fit: BoxFit.cover,
                ),

                // Upper Text
                Positioned(
                  top: 2,
                  left: 5,
                  child: SizedBox(
                    // In order to fix the text overflowed from image
                    width: height * .18,
                    child: GridItemTextSection(recipe.label.toString(),
                        height: height * .025),
                  ),
                ),

                // Lower Text
                Positioned(
                  bottom: 2,
                  left: 5,
                  child: SizedBox(
                    // In order to fix the text overflowed from image
                    width: height * .18,
                    child: GridItemTextSection(recipe.source.toString(),
                        height: height * .025, isSource: true),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * .01),

            // Properties Part (Calories, Ingredients)
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: height * .006),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Properties(
                        count: recipe.calories!.toInt().toString(),
                        type: 'CAL'),
                    CalIngrDivider(height: height),
                    Properties(
                        count: recipe.ingredients!.length.toString(),
                        type: 'INGR'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> pushToRecipeDetailScreen(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RecipeDetailsScreen(recipe: recipe)));
  }
}
