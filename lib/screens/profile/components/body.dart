import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/providers/customer_provider.dart';
import 'package:store_app/screens/login/login_screen.dart';
import 'package:store_app/screens/profile/components/profile_menu_card.dart';
import 'package:store_app/screens/profile/components/profile_pic_card.dart';
import 'package:store_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final customerProvider = Provider.of<CustomerProvider>(
      context,
      listen: false,
    );

    Future<void> logout() async {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Successfully logged out',
            style: TextStyle(color: Colors.tealAccent.shade200),
          ),
          backgroundColor: background.withOpacity(0.1),
          duration: Duration(seconds: 3),
        ),
      );

      await Future.delayed(const Duration(seconds: 3));

      customerProvider.logout();
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          LoginScreen.routeName,
          (Route<dynamic> route) => false,
        );
      }
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          ProfilePicCard(),
          SizedBox(height: getProportionateScreenWidth(10)),
          ProfileMenuCard(
            profileMenuText: "My account",
            profileMenuIcon: Icons.person,
            onProfileMenuPress: () {},
          ),
          ProfileMenuCard(
            profileMenuText: "My Notifications",
            profileMenuIcon: Icons.notifications,
            onProfileMenuPress: () {},
          ),
          ProfileMenuCard(
            profileMenuText: "My Favorites",
            profileMenuIcon: Icons.favorite,
            onProfileMenuPress: () {},
          ),
          ProfileMenuCard(
            profileMenuText: "Settings",
            profileMenuIcon: Icons.settings,
            onProfileMenuPress: () {},
          ),
          ProfileMenuCard(
            profileMenuText: "Our Policies",
            profileMenuIcon: Icons.policy,
            onProfileMenuPress: () {},
          ),
          ProfileMenuCard(
            profileMenuText: "Sing out",
            profileMenuIcon: Icons.logout,
            onProfileMenuPress: logout,
          ),
        ],
      ),
    );
  }
}
