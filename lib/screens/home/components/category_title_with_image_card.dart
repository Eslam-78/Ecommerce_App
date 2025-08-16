import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/category_provider.dart';
import 'package:store_app/screens/home/components/category_image_special_card.dart';
import 'package:store_app/screens/home/components/category_title.dart';
import 'package:store_app/size_config.dart';

class CategoryTitleWithImageCard extends StatelessWidget {
  const CategoryTitleWithImageCard({super.key});
  static const List<String> categoriesImage = [
    "assets/images/Category_1.jpg",
    "assets/images/Category_2.jpg",
    "assets/images/Category_3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final categories = categoryProvider.categories;
    final isLoading = categoryProvider.isLoading;
    return Column(
      children: [
        CategoriesTitle(
          categoryTitleText: "Our Special Sections for you",
          onSeeMorePress: () {},
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        if (isLoading)
          const Center(child: CircularProgressIndicator())
        else if (categories.isEmpty)
          const Center(child: Text("No categories available"))
        else
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  categories.length,
                  (index) => CategoryImageSpecialCard(
                    onCategoryImagePress: () {},
                    categoryImage:
                        index < categoriesImage.length
                            ? categoriesImage[index]
                            : "assets/images/ads_1.jpg",
                    category: categories[index],
                  ),
                ),

                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          ),
      ],
    );
  }
}
