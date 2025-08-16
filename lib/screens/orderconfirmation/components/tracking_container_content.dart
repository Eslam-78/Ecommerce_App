import 'package:flutter/material.dart';
import 'package:store_app/size_config.dart';

class TrackingContainerContent extends StatelessWidget {
  const TrackingContainerContent({
    super.key,
    required this.trackingTitle,
    required this.trackingSubtitle,
    required this.isTrackingCompleted,
  });
  final String trackingTitle, trackingSubtitle;
  final bool isTrackingCompleted;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: getProportionateScreenWidth(24),
            height: getProportionateScreenWidth(24),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  isTrackingCompleted ? Colors.greenAccent : Colors.grey[700],
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 2,
              ),
            ),
            child:
                isTrackingCompleted
                    ? Icon(Icons.check, size: 16, color: Colors.black)
                    : null,
          ),
          SizedBox(width: getProportionateScreenWidth(15)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trackingTitle,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  trackingSubtitle,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                    color: Colors.grey[400],
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
