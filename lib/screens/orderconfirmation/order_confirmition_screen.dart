import 'package:flutter/material.dart';
import 'package:store_app/models/orderwithdetails.dart';
import 'package:store_app/screens/orderconfirmation/components/body.dart';

class OrderConfirmitionScreen extends StatelessWidget {
  static String routeName = "/order_confirmation";

  const OrderConfirmitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as OrderWithDetails;

    return Scaffold(
      appBar: AppBar(
        title: Text("Order Confirmation"),
        elevation: 0,
        leading: SizedBox(),
      ),
      body: Body(order: args),
    );
  }
}
