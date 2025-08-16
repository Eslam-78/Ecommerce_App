import 'package:flutter/material.dart';
import 'package:store_app/size_config.dart';

class CheckOutBottomBar extends StatelessWidget {
  const CheckOutBottomBar({
    super.key,
    required this.totalAmount,
    required this.onPlaceOrder,
  });

  final double totalAmount;
  final VoidCallback onPlaceOrder;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(12),
        ),
        decoration: BoxDecoration(
          color: Colors.grey[900]!.withOpacity(0.9),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 3,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          height: getProportionateScreenHeight(56),
          child: ElevatedButton(
            onPressed: onPlaceOrder,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
              elevation: 5,
              shadowColor: Colors.deepPurple.withOpacity(0.5),
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(14),
              ),
            ),
            child: Text(
              "Place Order - ${totalAmount.toStringAsFixed(2)} RY",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
