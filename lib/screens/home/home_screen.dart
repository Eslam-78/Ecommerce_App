import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/custom_bottom_nav_bar.dart';
import 'package:store_app/enums.dart';
import 'package:store_app/providers/category_provider.dart';
import 'package:store_app/providers/product_provider.dart';
import 'package:store_app/screens/home/components/body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
      Provider.of<CategoryProvider>(context, listen: false).fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: NavBarMenu.home),
    );
  }
}
