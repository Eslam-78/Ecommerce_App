class Order {
  final int? id;
  final int customerId;
  final double totalAmount;
  final String shippingAddress;
  final String paymentMethod;
  final String shippingStatus;
  final String? trackingNumber;
  final String? notes;
  final DateTime orderDate;

  Order({
    this.id,
    required this.customerId,
    required this.totalAmount,
    required this.shippingAddress,
    required this.paymentMethod,
    this.shippingStatus = 'Pending',
    this.trackingNumber,
    this.notes,
    required this.orderDate,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      customerId: json['customerId'],
      totalAmount: (json['totalAmount'] as num).toDouble(),
      shippingAddress: json['shippingAddress'],
      paymentMethod: json['paymentMethod'],
      shippingStatus: json['shippingStatus'] ?? 'Shipped',
      trackingNumber: json['trackingNumber'],
      notes: json['notes'],
      orderDate: DateTime.parse(json['orderDate']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'customerID': customerId,
    'totalAmount': totalAmount,
    'shippingAddress': shippingAddress,
    'paymentMethod': paymentMethod,
    'shippingStatus': shippingStatus,
    'trackingNumber': trackingNumber,
    'notes': notes,
    'orderDate': orderDate.toIso8601String(),
  };
}
