import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/orderwithdetails.dart';
import 'package:store_app/screens/order_details/order_details_screen.dart';
import 'package:store_app/providers/checkout_provider.dart';
import 'package:store_app/screens/home/home_screen.dart';
import 'package:store_app/screens/orderconfirmation/components/confirmation_button_home.dart';
import 'package:store_app/screens/orderconfirmation/components/confirmation_logo_with_text.dart';
import 'package:store_app/screens/orderconfirmation/components/confirmation_trnumber_with_price.dart';
import 'package:store_app/screens/orderconfirmation/components/tracking_container_card.dart';
import 'package:store_app/size_config.dart';

class Body extends StatefulWidget {
  final OrderWithDetails order;

  const Body({super.key, required this.order});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final productPrice = widget.order.totalAmount;
    final checkoutProvider = Provider.of<OrderProvider>(context);
    final totalPrice = checkoutProvider.calculateTotal(productPrice);
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OrderConfLogoWithTitle(
                confirmationLogo: Icons.check_circle_outline,
                confirmationText: "Congrats!! Your Order Confirmed!",
              ),
              SizedBox(height: getProportionateScreenHeight(8)),
              ConfirmationTrNumberWithPrice(
                widget: widget,
                totalPrice: totalPrice,
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              TrackingContainerCard(
                containerTitle: "Order Tracking",
                containerIcon: Icons.local_shipping,
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              Row(
                children: [
                  Expanded(
                    child: ConfirmationButtonHome(
                      onButtonPress:
                          () => Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeScreen.routeName,
                            (Route<dynamic> route) => false,
                          ),
                      buttonTitle: "Back to Home",
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  Expanded(
                    child: ConfirmationButtonHome(
                      onButtonPress:
                          () => Navigator.pushNamed(
                            context,
                            OrderDetailsScreen.routeName,
                            arguments: widget.order,
                          ),

                      buttonTitle: "Check Order Details",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
