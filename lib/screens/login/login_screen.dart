import 'package:flutter/material.dart';
import 'package:store_app/screens/login/components/body.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: Body());
  }

  AppBar buildAppBar() {
    return AppBar(title: Text("Login"));
  }
}
