import 'package:flutter/material.dart';
import 'package:store_app/screens/orderconfirmation/components/tracking_container_content.dart';
import 'package:store_app/size_config.dart';

class TrackingContainerCard extends StatelessWidget {
  const TrackingContainerCard({
    super.key,
    required this.containerTitle,
    required this.containerIcon,
  });
  final String containerTitle;
  final IconData containerIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      decoration: BoxDecoration(
        color: Colors.grey[900]!.withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.deepPurpleAccent.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.2),
            blurRadius: 12,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(containerIcon, color: Colors.amberAccent),
              SizedBox(width: getProportionateScreenWidth(10)),
              Text(
                containerTitle,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(13)),
          Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(3)),
            child: Column(
              children: [
                TrackingContainerContent(
                  trackingTitle: "Order Placed",
                  trackingSubtitle: "Your order has been received",
                  isTrackingCompleted: true,
                ),
                TrackingContainerContent(
                  trackingTitle: "Processing",
                  trackingSubtitle: "Preparing your order",
                  isTrackingCompleted: true,
                ),
                TrackingContainerContent(
                  trackingTitle: "On the way",
                  trackingSubtitle: "Your order is out for delivery",
                  isTrackingCompleted: false,
                ),
                TrackingContainerContent(
                  trackingTitle: "Delivered",
                  trackingSubtitle: "Expected by 2 days",
                  isTrackingCompleted: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
