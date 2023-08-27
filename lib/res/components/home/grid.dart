import 'package:flutter/material.dart';

import '../../../model/search_result_model.dart';
import 'grid_item.dart';

class Grid extends StatelessWidget {
  final int itemCount; // Length of the grid
  final List<Hits> hits; // Widgets to be displayed
  final double height;

  const Grid(
      {Key? key,
      required this.itemCount,
      required this.hits,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(
            horizontal: height * .02, vertical: height * .025),
        shrinkWrap: true,
        physics:
            const BouncingScrollPhysics(), // Bouncing scrolling for the grid
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items in each row
          mainAxisExtent: height * .27, // .28
          crossAxisSpacing:
              height * .02, // Add horizontal spacing between grid items
          mainAxisSpacing:
              height * .02, // Add vertical spacing between grid items
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return GridItem(recipe: hits[index].recipe!);
        },
      ),
    );
  }
}
