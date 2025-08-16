import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/default_button.dart' show DefaultButton;
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/screens/checkout/check_out_screen.dart';
import 'package:store_app/size_config.dart';

class CartCheckOutCard extends StatelessWidget {
  const CartCheckOutCard({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPrice = context.select<CartProvider, double>(
      (cart) => cart.totalPrice,
    );
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItemsCount = cartProvider.items.length;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(16),
        horizontal: getProportionateScreenWidth(30),
      ),

      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: const Color(0xFF1F1B2E), // لون بنفسجي غامق أنيق
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 10,
            color: Colors.deepPurple.withOpacity(0.1), // ظل بنفسجي ناعم
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.pages, color: Colors.amberAccent),
                ),
                Spacer(),
                Text("Add Gift Discount code"),
                const SizedBox(width: 10),
                Icon(Icons.arrow_forward_ios_rounded, size: 13),
              ],
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "Total Amount:\n",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text:
                              "${totalPrice.toStringAsFixed(3)} RY", // ✔️ يتم التحديث عند التغيير فقط,
                          style: TextStyle(
                            color: Colors.amberAccent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(140),
                  child: DefaultButton(
                    buttonText: "Check Out",
                    onButtonPress: () {
                      if (cartItemsCount > 0) {
                        Navigator.pushNamed(context, CheckOutScreen.routeName);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "You haven't added any products yet!",
                              style: TextStyle(
                                color: Colors.redAccent.shade200,
                              ),
                            ),
                            backgroundColor: Color(0x1AFFFFFF), //white with opacity %10
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
