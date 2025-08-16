import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/providers/checkout_provider.dart';
import 'package:store_app/size_config.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutProvider = Provider.of<OrderProvider>(context);
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
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
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(9)),
                decoration: BoxDecoration(
                  color: background.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Image.asset(
                  "assets/images/CreditCard.png",
                  height: getProportionateScreenWidth(23), // زيادة الحجم
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(13)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      checkoutProvider.paymentMethod,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(width: getProportionateScreenWidth(5)),
                    Text(
                      "Expires 7/26",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => _showPaymentMethods(context, checkoutProvider),
                icon: Icon(Icons.edit_outlined, color: Colors.amberAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showPaymentMethods(BuildContext context, OrderProvider provider) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: blackBackground.withOpacity(0.9),
            title: Text(
              "Select Payment Method",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
            ),

            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(),
                _buildPaymentOption(
                  context,
                  title: "Credit Card /Ends by 966",
                  icon: Icons.credit_card,
                  isSelected: provider.paymentMethod == "Credit Card",
                  onTap: () => provider.updatePaymentMethod("Credit Card"),
                ),
                _buildPaymentOption(
                  context,
                  title: "PayPal /Ends by 0064",
                  icon: Icons.credit_score,
                  isSelected: provider.paymentMethod == "PayPal",
                  onTap: () => provider.updatePaymentMethod("PayPal"),
                ),
                _buildPaymentOption(
                  context,
                  title: "COD /Code 00**94",
                  icon: Icons.money,
                  isSelected: provider.paymentMethod == "COD",
                  onTap: () => provider.updatePaymentMethod("COD"),
                ),
              ],
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor: blackBackground),
                onPressed: () => Navigator.pop(context),
                child: Text("Close"),
              ),
            ],
          ),
    );
  }

  Widget _buildPaymentOption(
    BuildContext context, {
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.amberAccent : Colors.grey),
      title: Text(title),
      trailing: isSelected ? Icon(Icons.check, color: Colors.green) : null,
      onTap: () {
        onTap();
        Navigator.pop(context);
      },
    );
  }
}
