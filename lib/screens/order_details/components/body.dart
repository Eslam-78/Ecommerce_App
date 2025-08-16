import 'package:flutter/material.dart';
import 'package:store_app/models/orderwithdetails.dart';
import 'package:store_app/screens/order_details/components/order_details_summary_card.dart';
import 'package:store_app/screens/order_details/components/order_products_list.dart';
import 'package:store_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.orderWithDetails});

  final OrderWithDetails orderWithDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenHeight(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderDetailsSummaryCard(order: orderWithDetails.order),
          SizedBox(height: getProportionateScreenHeight(20)),
          OrderProductsList(details: orderWithDetails.details),
        ],
      ),
    );
  }
}
