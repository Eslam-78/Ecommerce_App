import 'package:flutter/material.dart';
import 'package:store_app/size_config.dart';

class ConfirmationButtonHome extends StatelessWidget {
  const ConfirmationButtonHome({
    super.key,
    required this.onButtonPress,
    required this.buttonTitle,
  });
  final VoidCallback onButtonPress;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(15),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onButtonPress,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(15),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                buttonTitle,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(12),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
