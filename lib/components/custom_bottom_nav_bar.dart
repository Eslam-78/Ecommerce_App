import 'package:flutter/material.dart';
import 'package:store_app/enums.dart';
import 'package:store_app/screens/home/home_screen.dart';
import 'package:store_app/screens/profile/profile_screen.dart';
import 'package:store_app/size_config.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.selectedMenu});

  final NavBarMenu selectedMenu;
  @override
  Widget build(BuildContext context) {
    final Color inSelectedIconColor = Colors.amber;
    return Container(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),

      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: const Color(0xFF1F1B2E), // لون بنفسجي غامق أنيق
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 10,
            color: Colors.deepPurple.withOpacity(0.1), // ظل بنفسجي ناعم
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed:
                  () => Navigator.pushNamed(context, HomeScreen.routeName),
              icon: Icon(
                Icons.home,
                color:
                    NavBarMenu.home == selectedMenu
                        ? inSelectedIconColor
                        : null,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message,
                color:
                    NavBarMenu.message == selectedMenu
                        ? inSelectedIconColor
                        : null,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color:
                    NavBarMenu.favorite == selectedMenu
                        ? inSelectedIconColor
                        : null,
              ),
            ),
            IconButton(
              onPressed:
                  () => Navigator.pushNamed(context, ProfileScreen.routeName),
              icon: Icon(
                Icons.person,
                color:
                    NavBarMenu.profile == selectedMenu
                        ? inSelectedIconColor
                        : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
