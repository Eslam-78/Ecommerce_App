import 'package:flutter/material.dart';
import 'package:store_app/screens/checkout/components/address_card.dart';
import 'package:store_app/screens/checkout/components/order_summary_card.dart';
import 'package:store_app/screens/checkout/components/payment_method_card.dart';
import 'package:store_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(getProportionateScreenWidth(24)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Shiping Address",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: getProportionateScreenWidth(18)),
            AddressCard(),
            SizedBox(height: getProportionateScreenWidth(20)),
            Text(
              "Payment Method",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: getProportionateScreenWidth(18)),
            PaymentMethodCard(),
            SizedBox(height: getProportionateScreenWidth(20)),
            Text("Order Summary", style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: getProportionateScreenWidth(18)),
            OrderSummaryCard(),
            SizedBox(height: getProportionateScreenWidth(20)),
          ],
        ),
      ),
    );
  }
}
