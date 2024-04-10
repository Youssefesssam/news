import 'package:flutter/material.dart';
import 'package:news/ui/widets/app_loclization.dart';
import 'package:provider/provider.dart';
import '../../../../data/providerLanguage/providerLanguage.dart';
import '../../../../model/category.dart';
import 'category_widget.dart';

class CategoriesTab extends StatelessWidget {
  final void Function(Category) onCategoryClick;

  const CategoriesTab({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    ProviderLanguage providerLanguage =Provider.of(context);
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(context.l10n(context).pickYourCategory,style: TextStyle(color: Color(0xff4f5a68),fontSize: 30,fontWeight: FontWeight.bold) ,),
          const SizedBox(height: 5,),
           Text(context.l10n(context).ofInterest,style: TextStyle(color: Color(0xff4f5a68),fontSize: 30,fontWeight: FontWeight.bold),),
          const SizedBox(height: 30,),
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
