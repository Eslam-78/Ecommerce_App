import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/providers/checkout_provider.dart';
import 'package:store_app/providers/customer_provider.dart';
import 'package:store_app/screens/checkout/components/body.dart';
import 'package:store_app/screens/checkout/components/check_out_bottom_bar.dart';
import 'package:store_app/screens/orderconfirmation/order_confirmition_screen.dart';

class CheckOutScreen extends StatelessWidget {
  static String routeName = "/checkout";
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final checkoutProvider = Provider.of<OrderProvider>(context);
    final customerProvider = Provider.of<CustomerProvider>(context);
    final productTotalPrice = cartProvider.totalPrice;
    final totalAmount = checkoutProvider.calculateTotal(productTotalPrice);
    return Scaffold(
      appBar: AppBar(title: Text("CheckOut")),
      body: Body(),
      bottomNavigationBar: CheckOutBottomBar(
        totalAmount: totalAmount,
        onPlaceOrder: () async {
          // Loading State
          showDialog(
            context: context,
            barrierDismissible: false,
            builder:
                (context) => const Center(child: CircularProgressIndicator()),
          );

          try {
            final result = await checkoutProvider.submitOrder(
              totalAmount: cartProvider.totalPrice,
              cartItems: cartProvider.items,
              customerId: customerProvider.customerId ?? 1,
            );
            log(
              "Customer ID to be used in order: ${customerProvider.customerId}",
            );
            if (context.mounted) {
              Navigator.of(context).pop(); // إغلاق تحميل
            }
            if (result != null && context.mounted) {
              // نجاح الطلب
              Navigator.pushNamed(
                context,
                OrderConfirmitionScreen.routeName,
                arguments: result,
              );
              cartProvider.clearCart();
            } else if (context.mounted) {
              // فشل الطلب
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    checkoutProvider.error ?? 'Failed to place order',
                  ),
                ),
              );
            }
          } catch (e) {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
            // إغلاق تحميل في حالة الخطأ
            if (context.mounted) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(' ${e.toString()}')));
              log('Order error details: $e');
            }
          }
        },
      ),
    );
  }
}
