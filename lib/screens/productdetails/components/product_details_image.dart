import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/size_config.dart';

class ProductDetailsImage extends StatefulWidget {
  const ProductDetailsImage({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsImage> createState() => _ProductDetailsImageState();
}

class _ProductDetailsImageState extends State<ProductDetailsImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: getProportionateScreenWidth(230),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: background.withOpacity(0.1),

              // تخلي خلفية بيضاء خفيفة
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Image.asset(widget.product.imageURL),
            ),
          ),
        ),
      ],
    );
  }
}
