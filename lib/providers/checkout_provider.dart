import 'package:flutter/foundation.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/order.dart';
import 'package:store_app/models/orderdetails.dart';
import 'package:store_app/models/orderwithdetails.dart';
import 'package:store_app/repositories/order_repository.dart';
import 'package:store_app/services/internet_ckeck_connection.dart';

class OrderProvider with ChangeNotifier {
  final OrderRepository _orderRepository;
  String _shippingAddress = "60 Main Street Shamlan, Sana`a";
  String _paymentMethod = "Credit Card";
  double _shippingPrice = 50.00; // Default Shipping Price
  double _taxRate = 0.1; // Default Tax 10%
  String _notes = "";
  bool _isLoading = false;
  String? _error;

  OrderProvider({required OrderRepository orderRepository})
    : _orderRepository = orderRepository;

  // Getters
  String get shippingAddress => _shippingAddress;
  String get paymentMethod => _paymentMethod;
  double get shippingPrice => _shippingPrice;
  double get taxRate => _taxRate;
  String get notes => _notes;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Setters
  void updateShippingAddress(String newAddress) {
    _shippingAddress = newAddress;
    notifyListeners();
  }

  void updatePaymentMethod(String newMethod) {
    _paymentMethod = newMethod;
    notifyListeners();
  }

  void updateNotes(String newNotes) {
    _notes = newNotes;
    notifyListeners();
  }

  void updateShippingPrice(double newPrice) {
    _shippingPrice = newPrice;
    notifyListeners();
  }

  void updateTaxRate(double newRate) {
    _taxRate = newRate;
    notifyListeners();
  }

  // Calculate Tax depending on total price
  double calculateTax(double subtotal) {
    return subtotal * _taxRate;
  }

  // The final whole price to place order
  double calculateTotal(double subtotal) {
    return subtotal + _shippingPrice + calculateTax(subtotal);
  }

  Future<OrderWithDetails?> submitOrder({
    required double totalAmount,
    required List<Cart> cartItems,
    required int customerId,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // first check connection
      bool isConnected = await checkInternetConnection();
      if (!isConnected) {
        _error = "No Internet Connection";
        return null;
      }

      // Preparing order data
      final order = Order(
        id: 0, // Servel by default will give the value og orderId
        customerId: customerId,
        totalAmount: totalAmount,
        shippingAddress: _shippingAddress,
        paymentMethod: _paymentMethod,
        shippingStatus: 'Pending', // By default
        orderDate: DateTime.now(),
      );
      // Preparing order details data
      final orderDetails =
          cartItems
              .map(
                (item) => OrderDetail(
                  // conver all cart item objects to orderDetails object
                  orderDetailId: 0, // default by Server
                  orderId: 0, // Default by server
                  productId: item.productId,
                  unitPrice: item.price,
                  quantity: item.quantity,
                ),
              )
              .toList();

      // Send Order Data & Details Data to Server by Repo
      final createdOrder = await _orderRepository.createOrder(
        order: order,
        details: orderDetails,
      );

      // Return the result to model OrderWithDetails
      return OrderWithDetails(
        order: createdOrder,
        details:
            orderDetails
                .map(
                  (d) => d.copyWith(orderId: createdOrder.id),
                ) // go to every foregine key orderiD in orderDetails and make it = main order id
                .toList(),
        // to connect every detailsOrder by its own order
      );
    } catch (e) {
      _error = "Failed to place order: ${e.toString()}";
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /* String _generateTrackingNumber() {
    return "ORD${DateTime.now().microsecondsSinceEpoch.toString().substring(7)}";
  }*/
}
