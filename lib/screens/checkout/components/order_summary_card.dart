import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/providers/checkout_provider.dart';
import 'package:store_app/size_config.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final checkoutProvider = Provider.of<OrderProvider>(context);
    final productTotalPrice = cartProvider.totalPrice;
    final shippingPrice = checkoutProvider.shippingPrice;
    final tax = checkoutProvider.calculateTax(productTotalPrice);
    final total = checkoutProvider.calculateTotal(productTotalPrice);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenHeight(15),
      ),
      decoration: BoxDecoration(
        color: Colors.grey[900]!.withOpacity(0.7), // لون أغمق مع شفافية
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.deepPurpleAccent.withOpacity(0.3), // إطار بنفسجي ناعم
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.2), // ظل بنفسجي
            blurRadius: 12,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSummaryRow(
            context,
            title: "Products Total Price",
            value: "${productTotalPrice.toStringAsFixed(2)} RY",
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          _buildSummaryRow(
            context,
            title: "Shipping Price",
            value: "${shippingPrice.toStringAsFixed(2)} RY",
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          _buildSummaryRow(
            context,
            title: "Tax",
            value: "${tax.toStringAsFixed(2)} RY",
          ),
          Divider(
            color: Colors.grey[700],
            thickness: 0.5,
            height: getProportionateScreenHeight(20),
          ),
          _buildSummaryRow(
            context,
            title: "Total",
            value: "${(total).toStringAsFixed(2)} RY",
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    BuildContext context, {
    required String title,
    required String value,
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey[400],
            fontSize: getProportionateScreenWidth(isTotal ? 16 : 14),
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isTotal ? Colors.amberAccent : Colors.white,
            fontSize: getProportionateScreenWidth(isTotal ? 18 : 14),
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
