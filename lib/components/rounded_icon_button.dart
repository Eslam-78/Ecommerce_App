import 'package:flutter/material.dart';
import 'package:store_app/size_config.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    super.key,
    required this.buttonIcon,
    required this.onButtonPress,
  });
  final IconData buttonIcon;
  final GestureTapCallback onButtonPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: onButtonPress,
        child: Icon(buttonIcon),
      ),
    );
  }
}
