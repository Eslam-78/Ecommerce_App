import 'package:flutter/material.dart';
import 'package:store_app/components/default_button.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/screens/login/login_screen.dart';
import 'package:store_app/screens/splash/components/splash_content.dart';
import 'package:store_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      'text': "Welcome to Dark Market,Lets`s shop!",
      'image': "assets/images/splash_1.png",
    },
    {
      'text': "We help people connect with store \narround Republic of Yemen.",
      'image': "assets/images/splash_2.png",
    },
    {
      'text':
          "We give use the easiest way to shop. \nJust stay at home and use Dark Market!",
      'image': "assets/images/splash_3.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder:
                    (context, index) => SplashContent(
                      text: splashData[index]['text']!,
                      image: splashData[index]['image']!,
                    ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(50)),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index),
                      ),
                    ),
                    Spacer(flex: 2),
                    DefaultButton(
                      buttonText: 'Continue',
                      onButtonPress: () {
                        //Go to LoginScreen and take The route name from static variable
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? purpleText : textSecondary,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
