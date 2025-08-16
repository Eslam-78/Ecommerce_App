import 'package:flutter/material.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/size_config.dart';

class ProductDetailsNameAndDesc extends StatelessWidget {
  const ProductDetailsNameAndDesc({
    super.key,
    required this.product,
    required this.onSeeMorePress,
  });

  final Product product;
  final GestureTapCallback onSeeMorePress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(25),
          ),
          child: Text(
            product.name,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(30),
            right: getProportionateScreenWidth(50),
          ),
          child: Text(product.description, maxLines: 4),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(10),
          ),
          child: GestureDetector(
            onTap: onSeeMorePress,
            child: Row(
              children: [
                Text(
                  "See more Details...",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 127, 69, 227),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_sharp,
                  size: 10,
                  color: const Color.fromARGB(255, 148, 109, 254),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
