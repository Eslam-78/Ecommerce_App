import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/size_config.dart';

class ProductDotColorContainer extends StatelessWidget {
  const ProductDotColorContainer({
    super.key,
    required this.productColor,
    this.isProductColorSelected = false,
  });
  final Color productColor;
  final bool isProductColorSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: getProportionateScreenWidth(5)),
      padding: EdgeInsets.all(8),
      width: getProportionateScreenWidth(40),
      height: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color:
              isProductColorSelected
                  ? const Color.fromARGB(255, 44, 199, 152)
                  : background,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: productColor, shape: BoxShape.circle),
      ),
    );
  }
}
