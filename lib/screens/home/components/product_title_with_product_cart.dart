import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/product_provider.dart';
import 'package:store_app/screens/home/components/product_card.dart';
import 'package:store_app/screens/home/components/products_title.dart';
import 'package:store_app/screens/productdetails/product_details_screen.dart';
import 'package:store_app/size_config.dart';

class ProductTitleWithProductCard extends StatelessWidget {
  const ProductTitleWithProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final products = productProvider.products;
    final isLoading = productProvider.isLoading;
    return Column(
      children: [
        ProductsTitle(
          productsTitleText: "Common Products",
          onSeeMorePress: () {},
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        if (isLoading)
          const Center(child: CircularProgressIndicator()) // يظهر وقت التحميل
        else if (products.isEmpty)
          const Center(
            child: Text('No products available'),
          ) // في حال مافيش منتجات
        else
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                //spread operator ...insted of writing this Row(children: [ProductCard(product: mockProducts[0]),ProductCard(product: mockProducts[1]),
                ...List.generate(
                  products.length,
                  (index) => ProductCard(
                    product: products[index],
                    onProductCardPress:
                        () => Navigator.pushNamed(
                          context,
                          ProductDetailsScreen.routeName,
                          arguments: ProductDetailsArgs(
                            product: products[index],
                          ),
                        ),
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(15)),
              ],
            ),
          ),
      ],
    );
  }
}
//✅ هنا نستخدم البمنتجات الذي هي جاياي من البروفايدر وليس من الموك برودوكت مباشرة كالتالي تحت
/*   ...List.generate(
                mockProducts.length,
                (index) => ProductCard(
                  product: mockProducts[index],
                  onProductCardPress:
                      () => Navigator.pushNamed(
                        context,
                        ProductDetailsScreen.routeName,
                        arguments: ProductDetailsArgs(
                          product: mockProducts[index],
                        ),
                      ),
                ),
              ), */