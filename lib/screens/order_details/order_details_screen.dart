import 'package:flutter/material.dart';
import 'package:store_app/models/orderwithdetails.dart';
import 'package:store_app/screens/order_details/components/body.dart';

class OrderDetailsScreen extends StatelessWidget {
  static String routeName = "/order_details";

  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderWithDetails orderWithDetails =
        ModalRoute.of(context)!.settings.arguments as OrderWithDetails;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Body(orderWithDetails: orderWithDetails),
    );
  }
}
