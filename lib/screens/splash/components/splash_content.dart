import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key, required this.text, required this.image});
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          'Dark Market',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: purpleText,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text(text, textAlign: TextAlign.center),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(350),
          width: getProportionateScreenWidth(250),
        ),
      ],
    );
  }
}
