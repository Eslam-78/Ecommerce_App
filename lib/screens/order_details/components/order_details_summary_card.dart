import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/order.dart';
import 'package:store_app/size_config.dart';

class OrderDetailsSummaryCard extends StatelessWidget {
  final Order order;

  const OrderDetailsSummaryCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: containerColor,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Order Number', order.id.toString()),
            _buildDetailRow('Date', order.orderDate.toString().split(" ")[0]),
            _buildDetailRow('Shipping Address', order.shippingAddress),
            _buildDetailRow(
              'Payment Method',
              order.paymentMethod,
              valueColor: Colors.teal.shade200,
            ),
            _buildDetailRow(
              'Status',
              order.shippingStatus,
              valueColor: Colors.amberAccent,
            ),
            _buildDetailRow(
              'Tracking Number',
              order.trackingNumber ?? "Not available",
              valueColor: Colors.teal.shade200,
            ),
            _buildDetailRow(
              'Notes',
              order.notes ?? "No notes",
              valueColor: Colors.blueGrey,
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Divider(),
            _buildDetailRow(
              'Total Amount',
              '\$${order.totalAmount.toStringAsFixed(2)}',
              isBold: true,
              valueColor: Colors.deepPurpleAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    bool isBold = false,
    Color? valueColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(4)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: valueColor ?? Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
