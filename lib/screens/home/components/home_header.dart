import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/screens/cart/cart_screen.dart';
import 'package:store_app/screens/home/components/icon_btn_with_container.dart';
import 'package:store_app/screens/home/components/search_container_field.dart';
import 'package:store_app/size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final totalItems = context.select<CartProvider, int>(
      (cart) => cart.totalItems,
    );
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchContainerField(),
          IconBtnWithContainer(
            typeOfIcon: Icons.notifications,
            currentIconCounter: 5,
            onIconPress: () {},
          ),
          IconBtnWithContainer(
            typeOfIcon: Icons.shopping_cart,
            currentIconCounter: totalItems,
            onIconPress:
                () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
        ],
      ),
    );
  }
}
