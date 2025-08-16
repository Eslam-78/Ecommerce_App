import 'package:flutter/material.dart';

class ProfilePicCard extends StatelessWidget {
  const ProfilePicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 110,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/profilepic.jpg"),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                color: Theme.of(context).primaryColorDark,
              ),
              child: Center(
                child: Icon(Icons.photo_camera, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
