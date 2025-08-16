import 'package:flutter/material.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/screens/productdetails/components/body.dart';
import 'package:store_app/screens/productdetails/components/custom_appbar.dart';

class ProductDetailsScreen extends StatelessWidget {
  static String routeName = "/product_details";

  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments
            as ProductDetailsArgs; //جيب البيانات المرسلة مع الصفحة وحولها إلى ProductDetailsArgs.
    return Scaffold(
      appBar: CustomAppBar(),
      body: Body(product: arguments.product),
    ); //أعطِ ويدجت Body المنتج اللي جلبناه عشان يعرض تفاصيله
  }
}

class ProductDetailsArgs {
  final Product product;

  ProductDetailsArgs({required this.product});
}
