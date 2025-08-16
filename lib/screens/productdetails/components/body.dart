import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/default_button.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/screens/productdetails/components/top_rounded_container.dart';
import 'package:store_app/screens/productdetails/components/product_details_image.dart';
import 'package:store_app/screens/productdetails/components/product_details_name_description.dart';
import 'package:store_app/screens/productdetails/components/product_dot_color_generator.dart';
import 'package:store_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.product});
  final Product product;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int counter = 0; // ننقل حالة العداد هنا
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductDetailsImage(product: widget.product),
          TopRoundedContainer(
            containerColor: containerColor,
            containerChild: Column(
              children: [
                ProductDetailsNameAndDesc(
                  product: widget.product,
                  onSeeMorePress: () {},
                ),
                TopRoundedContainer(
                  containerColor: Colors.transparent,
                  containerChild: Column(
                    children: [
                      ProductDotColorGenerator(
                        onCounterChanged: (newValue) {
                          setState(() {
                            counter = newValue;
                          });
                        },
                        initialCounter: counter,
                      ),
                      TopRoundedContainer(
                        containerColor: Colors.transparent,
                        containerChild: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth! * 0.25,
                            right: SizeConfig.screenWidth! * 0.25,
                            top: getProportionateScreenWidth(15),
                            bottom: getProportionateScreenWidth(40),
                          ),
                          child: DefaultButton(
                            buttonText: "Add to Cart",
                            onButtonPress: () {
                              if (counter > 0) {
                                final cartProvider = Provider.of<CartProvider>(
                                  context,
                                  listen: false,
                                );
                                cartProvider.addToCart(
                                  Cart(
                                    productId: widget.product.productID,
                                    name: widget.product.name,
                                    price: widget.product.price,
                                    imageUrl: widget.product.imageURL,
                                    quantity: counter,
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Product Successfully has added to cart",
                                      style: TextStyle(
                                        color: Colors.tealAccent.shade200,
                                      ),
                                    ),
                                    backgroundColor: background.withOpacity(
                                      0.1,
                                    ),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
