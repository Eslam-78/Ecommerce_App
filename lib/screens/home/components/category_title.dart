import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/size_config.dart';

class CategoriesTitle extends StatelessWidget {
  const CategoriesTitle({
    super.key,
    required this.categoryTitleText,
    required this.onSeeMorePress,
  });
  final String categoryTitleText;
  final GestureTapCallback onSeeMorePress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            categoryTitleText,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: background,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: onSeeMorePress,
            child: Text(
              "See More...",
              style: TextStyle(fontSize: getProportionateScreenWidth(12)),
            ),
          ),
        ],
      ),
    );
  }
}
