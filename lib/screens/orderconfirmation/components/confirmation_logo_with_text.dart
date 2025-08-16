import 'package:flutter/material.dart';
import 'package:store_app/size_config.dart';

class OrderConfLogoWithTitle extends StatelessWidget {
  const OrderConfLogoWithTitle({
    super.key,
    required this.confirmationLogo,
    required this.confirmationText,
  });
  final IconData confirmationLogo;
  final String confirmationText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          decoration: BoxDecoration(
            color:  Color(0x33FFFFFF), // أبيض مع شفافية 20% (0x33 = 20%)
            shape: BoxShape.circle,
          ),
          child: Icon(
            confirmationLogo,
            size: getProportionateScreenWidth(70),
            color: Colors.greenAccent,
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),

        // نص التأكيد
        Text(
          confirmationText,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
