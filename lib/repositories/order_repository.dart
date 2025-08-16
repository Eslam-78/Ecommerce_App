import 'dart:developer';

import 'package:store_app/models/order.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:store_app/models/orderdetails.dart';

class OrderRepository {
  final String baseUrl = "http://192.168.0.125:5058/api";

  Future<Order> createOrder({
    required Order order,
    required List<OrderDetail> details,
  }) async {
    log("Sending order with customerId: ${order.customerId}");
    final response = await http.post(
      Uri.parse('$baseUrl/orders'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'customerId': order.customerId,
        'totalAmount': order.totalAmount,
        'shippingAddress': order.shippingAddress,
        'paymentMethod': order.paymentMethod,
        'trackingNumber': order.trackingNumber,
        'orderDetails':
            details
                .map(
                  (d) => {
                    'productId': d.productId,
                    'quantity': d.quantity,
                    'unitPrice': d.unitPrice,
                  },
                )
                .toList(),
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final body = response.body;
      log("Response status: ${response.statusCode}");
      log("Response body: ${response.body}");
      if (body.isNotEmpty) {
        final responseData = json.decode(body);
        return Order.fromJson(responseData);
      } else {
        throw Exception("Empty response body from server.");
      }
    } else {
      throw Exception(
        'Failed to create order: ${response.statusCode} - ${response.reasonPhrase}\nBody: ${response.body}',
      );
    }
  }
}
