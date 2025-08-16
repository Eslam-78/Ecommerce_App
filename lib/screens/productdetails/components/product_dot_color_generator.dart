import 'package:flutter/material.dart';
import 'package:store_app/components/rounded_icon_button.dart';
import 'package:store_app/screens/productdetails/components/product_dot_color_container.dart';
import 'package:store_app/size_config.dart';

class ProductDotColorGenerator extends StatefulWidget {
  final Function(int)? onCounterChanged;
  final int initialCounter;
  const ProductDotColorGenerator({
    super.key,
    this.onCounterChanged,
    this.initialCounter = 0,
  });
  static const List<Color> mockProductColors = [
    Colors.black,
    Colors.grey,
    Colors.blueGrey,
  ];

  @override
  State<ProductDotColorGenerator> createState() =>
      _ProductDotColorGeneratorState();
}

class _ProductDotColorGeneratorState extends State<ProductDotColorGenerator> {
  late int counter;
  int selectedColor = 0;

  @override
  void initState() {
    super.initState();
    counter = widget.initialCounter;
  }

  void _updateCounter(int newValue) {
    setState(() {
      counter = newValue;
    });
    if (widget.onCounterChanged != null) {
      widget.onCounterChanged!(newValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        children: [
          ...List.generate(
            ProductDotColorGenerator.mockProductColors.length,
            (index) => Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(4)),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = index;
                  });
                },
                child: ProductDotColorContainer(
                  productColor:
                      ProductDotColorGenerator.mockProductColors[index],
                  isProductColorSelected: selectedColor == index,
                ),
              ),
            ),
          ),
          Spacer(),
          if (counter > 0)
            RoundedIconButton(
              buttonIcon: Icons.remove,
              onButtonPress: () => _updateCounter(counter - 1),
            ),
          if (counter > 0) SizedBox(width: getProportionateScreenWidth(11)),
          if (counter > 0)
            Container(
              constraints: BoxConstraints(
                maxWidth: getProportionateScreenWidth(
                  115,
                ), // حد أقصى لعرض العداد
              ),
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(12),
                vertical: getProportionateScreenHeight(8),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$counter',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(13),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  if (counter >= 3)
                    Flexible(
                      // استخدمنا Flexible بدل Padding مباشرة
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(3),
                        ),
                        child: Text(
                          '(Max 3)',
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(6),
                            color: Colors.red,
                          ),
                          overflow:
                              TextOverflow
                                  .visible, // يسمح بتجاوز النص إذا لزم الأمر
                        ),
                      ),
                    ),
                ],
              ),
            ),
          SizedBox(width: getProportionateScreenWidth(15)),
          RoundedIconButton(
            buttonIcon: Icons.add,
            onButtonPress: () => _updateCounter(counter < 3 ? counter + 1 : 3),
          ),
        ],
      ),
    );
  }
}
