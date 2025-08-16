import 'package:flutter/material.dart';
import 'package:store_app/components/rounded_icon_button.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
        ),
        child: Row(
          children: [
            RoundedIconButton(
              buttonIcon: Icons.arrow_back,
              onButtonPress: () => Navigator.pop(context),
            ),
            SizedBox(width: getProportionateScreenWidth(50)),
            Text("Product Details Page", style: TextStyle(color: purpleText)),
          ],
        ),
      ),
    );
  }
}
