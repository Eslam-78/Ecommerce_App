import 'package:flutter/foundation.dart';
import 'package:store_app/models/cart.dart';

class CartProvider with ChangeNotifier {
  final List<Cart> _items = [];

  List<Cart> get items => _items;
  //Number o whole products
  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  //Number of Unique products
  int get uniqueItemsCount => _items.length;

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void addToCart(Cart item) {
    final index = _items.indexWhere((i) => i.productId == item.productId);
    if (index >= 0) {
      _items[index].quantity +=
          item.quantity; // if product exists in cart just add anew quantity to this product
    } else {
      _items.add(item); // if product doesnt exist add the product to cart
    }
    notifyListeners();
  }

  void removeFromCart(int productId) {
    _items.removeWhere((item) => item.productId == productId);
    notifyListeners();
  }

  void updateQuantity(int productId, int newQuantity) {
    final index = _items.indexWhere((item) => item.productId == productId);
    if (index >= 0) {
      _items[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
