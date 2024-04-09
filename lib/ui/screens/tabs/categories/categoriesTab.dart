import 'package:flutter/material.dart';

import '../../../../model/category.dart';
import 'category_widget.dart';

class CategoriesTab extends StatelessWidget {
  final void Function(Category) onCategoryClick;

  const CategoriesTab({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Text("pick your category of interest"),
          Expanded(
            child: GridView.builder(
              itemCount: Category.categories.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategoryClick(Category.categories[index]);
                    },
                    child: AppCategory(
                      category: Category.categories[index],
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
