import 'package:flutter/cupertino.dart';
import 'package:store_app/screens/cart/cart_screen.dart';
import 'package:store_app/screens/checkout/check_out_screen.dart';
import 'package:store_app/screens/home/home_screen.dart';
import 'package:store_app/screens/login/login_screen.dart';
import 'package:store_app/screens/login_done/login_done_screen.dart';
import 'package:store_app/screens/order_details/order_details_screen.dart';
import 'package:store_app/screens/orderconfirmation/order_confirmition_screen.dart';
import 'package:store_app/screens/productdetails/product_details_screen.dart';
import 'package:store_app/screens/profile/profile_screen.dart';
import 'package:store_app/screens/splash/splash_screen.dart';

//All Application Routes to Pages will be here
//Those Are A named Routes
final Map<String, WidgetBuilder> appRoutes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  LoginDoneScreen.routeName: (context) => LoginDoneScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProductDetailsScreen.routeName: (cotext) => ProductDetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  CheckOutScreen.routeName: (context) => CheckOutScreen(),
  OrderConfirmitionScreen.routeName: (context) => OrderConfirmitionScreen(),
  OrderDetailsScreen.routeName: (context) => OrderDetailsScreen(),
};
