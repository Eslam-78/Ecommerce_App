import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/orderdetails.dart';
import 'package:store_app/size_config.dart';

class OrderProductsList extends StatelessWidget {
  final List<OrderDetail> details;

  const OrderProductsList({super.key, required this.details});
  final Map<int, String> productNames = const {
    1: "Smartphone X10",
    2: "Bluetooth Headphones",
    3: "Ultra Slim Laptop",
    4: "Fast Blender B-20",
    5: "20-Cubic Refrigerator",
    6: "Natural Shampoo",
    7: "Moisturizing Cream",
    8: "Robot Vacuum",
    9: "Eau de Perfum",
    // أضف باقي المنتجات هنا حسب الحاجة
  };
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: details.length,
        separatorBuilder:
            (context, index) =>
                SizedBox(height: getProportionateScreenHeight(8)),
        itemBuilder: (context, index) {
          final item = details[index];
          final productName = productNames[item.productId] ?? 'Unknown Product';
          return Card(
            color: containerColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Name: $productName',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(6)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantity: ${item.quantity}',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Price: \$${item.unitPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(6)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Subtotal: \$${(item.unitPrice * item.quantity).toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
