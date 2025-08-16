// cart_item.dart
class Cart {
  final int productId;
  final String name;
  final double price;
  final String imageUrl;
  int quantity;

  Cart({
    required this.productId,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });
}
//Mock data for Cart

/*List<Cart> mockCart = [
  Cart(product: mockProducts[0], quantity: 3),
  Cart(product: mockProducts[2], quantity: 1),
  Cart(product: mockProducts[6], quantity: 1),
];*/
