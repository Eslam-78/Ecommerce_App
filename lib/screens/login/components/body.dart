import 'package:flutter/material.dart';
import 'package:store_app/screens/login/components/login_form.dart';
import 'package:store_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  "Welcome Back to Dark Market",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(15)),
                Text(
                  "Please Login with your first name ,last name and email  \nor continue with social media.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
