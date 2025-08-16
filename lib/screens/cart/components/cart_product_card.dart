import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/size_config.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.cart,
    this.onQuantityChanged,
  });

  final Cart cart;
  final Function(int)? onQuantityChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //The image of Product
        SizedBox(
          width: getProportionateScreenWidth(90),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: background.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(cart.imageUrl),
            ),
          ),
        ),
        SizedBox(width: getProportionateScreenWidth(15)),
        //Details and quantity
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cart.name, style: TextStyle(fontSize: 16), maxLines: 2),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "${cart.price} RY",
                style: TextStyle(
                  color: Colors.amberAccent,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: " x${cart.quantity}",
                    style: TextStyle(
                      color: background,
                    ).copyWith(fontSize: getProportionateScreenWidth(12)),
                  ),
                ],
              ),
            ),
            /* Spacer(),
            // أزرار الزيادة والنقصان (الإضافة الجديدة)
            // أزرار الزيادة والنقصان (الإضافة الجديدة)
            if (onQuantityChanged != null) ...[
              _buildQuantityButton(Icons.remove, () {
                if (cart.quantity > 1) {
                  onQuantityChanged!(cart.quantity - 1);
                }
              }),
              SizedBox(width: 8),
              _buildQuantityButton(Icons.add, () {
                if (cart.quantity < 99) {
                  // يمكنك تغيير الحد الأقصى
                  onQuantityChanged!(cart.quantity + 1);
                }
              }),
            ],*/
          ],
        ),
      ],
    );
  }

  // دالة مساعدة لإنشاء الأزرار
  /* Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, size: 16),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
      ),
    );
  }*/
}
