class OrderDetail {
  final int orderDetailId;
  final int orderId;
  final int productId;
  final double unitPrice;
  final int quantity;

  OrderDetail({
    required this.orderDetailId,
    required this.orderId,
    required this.productId,
    required this.unitPrice,
    required this.quantity,
  });
  OrderDetail copyWith({int? orderId}) {
    return OrderDetail(
      orderDetailId: orderDetailId,
      orderId: orderId ?? this.orderId,
      productId: productId,
      unitPrice: unitPrice,
      quantity: quantity,
    );
  }

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      orderDetailId: json['orderDetailId'],
      orderId: json['orderId'],
      productId: json['productId'],
      unitPrice: (json['unitPrice'] as num).toDouble(),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() => {
    'orderDetailId': orderDetailId,
    'orderId': orderId,
    'productId': productId,
    'unitPrice': unitPrice,
    'quantity': quantity,
  };
}
