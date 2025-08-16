import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/screens/cart/components/cart_product_card.dart';
import 'package:store_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Cart is Empty',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 50,
                    color: Colors.grey,
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(15),
                  ),
                  child: Dismissible(
                    key: Key(cart.items[index].productId.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      cartProvider.removeFromCart(cart.items[index].productId);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Product has Successfully Deleted from Cart',
                            style: TextStyle(
                              color: Colors.amberAccent.shade200,
                            ),
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor:  Color(0x1AFFFFFF), //white with opacity %10
                        ),
                      );
                    },
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 235, 129, 129),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(children: [Spacer(), Icon(Icons.delete)]),
                    ),
                    child: CartProductCard(
                      cart: cart.items[index],
                      onQuantityChanged: (newQuantity) {
                        cartProvider.updateQuantity(
                          cart.items[index].productId,
                          newQuantity,
                        );
                      },
                    ),
                  ),
                ),
          );
        },
      ),
    );
  }
}
