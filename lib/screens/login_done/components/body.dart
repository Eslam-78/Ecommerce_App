import 'package:flutter/material.dart';
import 'package:store_app/components/default_button.dart';
import 'package:store_app/screens/home/home_screen.dart';
import 'package:store_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight! * 0.04),
        Image.asset(
          "assets/images/splash_4.png",
          height: SizeConfig.screenHeight! * 0.5, //50%
        ),

        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Your Login Done Successfully!!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: getProportionateScreenHeight(20),
              fontWeight: FontWeight.w700,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.5,
          child: DefaultButton(
            buttonText: "Back to Home",
            onButtonPress: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
