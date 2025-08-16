import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.cardWidth = 90,
    this.aspectRatio = 1.0,
    required this.product,
    required this.onProductCardPress,
  });
  final double cardWidth, aspectRatio;
  final Product product;
  final GestureTapCallback onProductCardPress;

  @override
  Widget build(BuildContext context) {
    bool isFavovritePressed = false;
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
      child: GestureDetector(
        onTap: onProductCardPress,
        child: SizedBox(
          width: getProportionateScreenWidth(cardWidth),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(product.imageURL),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                product.name,
                style: TextStyle(
                  color: background,
                  fontSize: getProportionateScreenWidth(13),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${product.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      fontWeight: FontWeight.w600,
                      color: Colors.amberAccent,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      isFavovritePressed = !isFavovritePressed;
                    },
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(4)),
                      width: getProportionateScreenWidth(20),
                      height: getProportionateScreenHeight(20),
                      decoration: BoxDecoration(
                        color: background.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.favorite, size: 13),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
