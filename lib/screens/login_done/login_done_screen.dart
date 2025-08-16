import 'package:flutter/material.dart';
import 'package:store_app/screens/login_done/components/body.dart';

class LoginDoneScreen extends StatelessWidget {
  static String routeName = "/login_done";
  const LoginDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            SizedBox(), //To delete the arrow from the left Screen use  leading: SizedBox(),
        title: Text("Login Done!!"),
      ),
      body: Body(),
    );
  }
}
