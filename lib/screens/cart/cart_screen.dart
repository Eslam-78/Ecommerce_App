import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/screens/cart/components/cart_cheackout_card.dart';
import 'package:store_app/size_config.dart';
import 'package:store_app/screens/cart/components/body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CartCheckOutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final totalItems = context.select<CartProvider, int>(
      (cart) => cart.totalItems,
    );
    return AppBar(
      title: Column(
        children: [
          Text("Your Marketing Cart"),
          SizedBox(height: getProportionateScreenHeight(5)),
          Text(
            "Curent items number:$totalItems",
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
