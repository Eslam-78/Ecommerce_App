import 'package:store_app/models/order.dart';
import 'package:store_app/models/orderdetails.dart';

class OrderWithDetails {
  final Order order;
  final List<OrderDetail> details;

  OrderWithDetails({required this.order, required this.details});

  double get totalAmount => order.totalAmount;
  String get trackingNumber => order.trackingNumber!;
}
