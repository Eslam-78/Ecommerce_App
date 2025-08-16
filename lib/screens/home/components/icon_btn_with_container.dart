import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/size_config.dart';

class IconBtnWithContainer extends StatelessWidget {
  const IconBtnWithContainer({
    super.key,
    required this.typeOfIcon,
    this.currentIconCounter = 0,
    required this.onIconPress,
  });
  final IconData typeOfIcon;
  final int currentIconCounter;
  final GestureTapCallback onIconPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onIconPress,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            width: getProportionateScreenWidth(49),
            height: getProportionateScreenHeight(46),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(typeOfIcon, color: background.withOpacity(0.7)),
          ),
          if (currentIconCounter !=
              0) // if counter not equal to 0 then show the numbers upon the icon or if 0 dont show
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: getProportionateScreenWidth(13),
                height: getProportionateScreenHeight(13),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 196, 43, 32),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$currentIconCounter",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(7),
                      height: getProportionateScreenHeight(1),
                      color: background,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
