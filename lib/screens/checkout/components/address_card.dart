import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/providers/checkout_provider.dart';
import 'package:store_app/size_config.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

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
              Icon(
                Icons.location_on_outlined,
                color: Colors.amberAccent.shade100,
                size: 28,
              ),
              SizedBox(width: getProportionateScreenWidth(15)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Current Location",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: getProportionateScreenWidth(3)),
                    Text(
                      checkoutProvider.shippingAddress,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed:
                    () => _showEditAddressDialog(context, checkoutProvider),
                icon: Icon(Icons.edit_outlined, color: Colors.amberAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showEditAddressDialog(BuildContext context, OrderProvider provider) {
    final controller = TextEditingController(text: provider.shippingAddress);

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: blackBackground.withOpacity(0.9),
            title: Text(
              "Edit Shipping Address",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            content: TextField(
              controller: controller,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your full address",
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  provider.updateShippingAddress(controller.text);
                  Navigator.pop(context);
                },
                child: Text("Save"),
              ),
            ],
          ),
    );
  }
}
