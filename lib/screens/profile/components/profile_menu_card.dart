import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/size_config.dart';

class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard({
    super.key,
    required this.profileMenuText,
    required this.profileMenuIcon,
    required this.onProfileMenuPress,
  });
  final String profileMenuText;
  final IconData profileMenuIcon;
  final VoidCallback onProfileMenuPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(10),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: background.withOpacity(0.1),
        ),
        onPressed: onProfileMenuPress,
        child: Row(
          children: [
            Icon(profileMenuIcon, size: 24, color: Colors.blueGrey),
            SizedBox(width: getProportionateScreenWidth(30)),
            Expanded(
              child: Text(
                profileMenuText,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
