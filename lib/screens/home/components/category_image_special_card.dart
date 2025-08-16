import 'package:flutter/material.dart';
import 'package:store_app/models/category.dart';
import 'package:store_app/size_config.dart';

class CategoryImageSpecialCard extends StatelessWidget {
  const CategoryImageSpecialCard({
    super.key,
    required this.onCategoryImagePress,
    required this.categoryImage,
    required this.category,
  });
  final String categoryImage;
  final Catigory category;
  final GestureTapCallback onCategoryImagePress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: onCategoryImagePress,
        child: SizedBox(
          width: getProportionateScreenWidth(240),
          height: getProportionateScreenWidth(125),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                //So the image take the whole space of container by force use Positined.fill()
                Positioned.fill(
                  child: Image.asset(categoryImage, fit: BoxFit.cover),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.4),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15),
                    vertical: getProportionateScreenWidth(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${category.name}\n",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getProportionateScreenWidth(20),
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.8),
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenWidth(4)),
                      Text(
                        category.description,
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: getProportionateScreenWidth(13),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
