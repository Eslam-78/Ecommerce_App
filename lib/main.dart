import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:store_app/fullscreen_manager.dart';
import 'package:store_app/all_app_routes.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/providers/category_provider.dart';
import 'package:store_app/providers/checkout_provider.dart';
import 'package:store_app/providers/customer_provider.dart';
import 'package:store_app/repositories/category_repository.dart';
import 'package:store_app/repositories/customer_repository.dart';
import 'package:store_app/repositories/order_repository.dart';
import 'package:store_app/repositories/product_repository.dart';
import 'package:store_app/screens/home/home_screen.dart';
import 'package:store_app/screens/login/login_screen.dart';
import 'package:store_app/screens/splash/splash_screen.dart';
import 'package:store_app/size_config.dart';
import 'package:store_app/theme.dart';
import 'providers/product_provider.dart';

void main() {
  Logger.level = Level.warning;
  runApp(FullScreenManager(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:
              (_) => ProductProvider(productRepository: ProductRepository()),
        ),
        ChangeNotifierProvider(
          create:
              (_) => CategoryProvider(categoryRepository: CategoryRepository()),
        ),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(
          create: (_) => OrderProvider(orderRepository: OrderRepository()),
        ),
        ChangeNotifierProvider(
          create:
              (_) => CustomerProvider(customerRepository: CustomerRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dark Market',
        theme: theme(context),
        initialRoute: LoginScreen.routeName,
        /*SplashScreen.routeName,*/
        /* LoginScreen.routeName,*/
        /*HomeScreen.routeName,*/

        /*SplashScreen.routeName,*/
        routes: appRoutes,
      ),
    );
  }
}
