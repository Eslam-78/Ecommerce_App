import 'package:flutter/material.dart';
import 'package:store_app/components/custom_bottom_nav_bar.dart';
import 'package:store_app/enums.dart';
import 'package:store_app/screens/profile/components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Profile")),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: NavBarMenu.profile),
    );
  }
}
