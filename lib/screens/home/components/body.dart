import 'package:flutter/material.dart';
import 'package:store_app/screens/home/components/category_title_with_image_card.dart';
import 'package:store_app/screens/home/components/discount_container.dart';
import 'package:store_app/screens/home/components/home_header.dart';
import 'package:store_app/screens/home/components/product_title_with_product_cart.dart';
import 'package:store_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(12)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenHeight(14)),
            DiscountCarousel(),
            SizedBox(height: getProportionateScreenHeight(23)),
            CategoryTitleWithImageCard(),
            SizedBox(height: getProportionateScreenHeight(15)),
            ProductTitleWithProductCard(),
            SizedBox(height: getProportionateScreenHeight(18)),
          ],
        ),
      ),
    );
  }
}
