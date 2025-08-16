import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/size_config.dart';

//this is a Default Splash Screen Button 'Continue'
class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.buttonText,
    required this.onButtonPress,
  });
  final String buttonText;
  final VoidCallback onButtonPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),

      child: ElevatedButton(
        onPressed: onButtonPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: textPrimary,
          foregroundColor: purpleText,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: getProportionateScreenWidth(18)),
        ),
      ),
    );
  }
}
