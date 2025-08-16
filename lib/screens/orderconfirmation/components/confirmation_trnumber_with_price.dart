import 'package:flutter/material.dart';
import 'package:store_app/screens/orderconfirmation/components/body.dart';
import 'package:store_app/size_config.dart';

class ConfirmationTrNumberWithPrice extends StatelessWidget {
  const ConfirmationTrNumberWithPrice({
    super.key,
    required this.widget,
    required this.totalPrice,
  });

  final Body widget;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
      ),
      child: Column(
        children: [
          Text(
            "Order #${widget.order.trackingNumber}",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: Colors.amberAccent,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(6)),

          // المبلغ الإجمالي
          Text(
            "Total: ${totalPrice.toStringAsFixed(2)} RY",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
