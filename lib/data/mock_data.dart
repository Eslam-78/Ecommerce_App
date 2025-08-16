// import '../models/category.dart';
// import '../models/product.dart';
// import '../models/customer.dart';
// import '../models/order.dart';

// class MockData {
//   // Categories with hierarchical structure
//   static List<Catigory> categories = [
//     Catigory(
//       id: 1,
//       name: 'Electronics',
//       description: 'All electronic and electrical devices',
//     ),
//     Catigory(
//       id: 2,
//       name: 'Computers',
//       description: 'Computers, laptops, and accessories',
//       parentCategoryId: 1,
//     ),
//     Catigory(
//       id: 3,
//       name: 'Mobile Phones',
//       description: 'Smartphones and accessories',
//       parentCategoryId: 1,
//     ),
//     Catigory(
//       id: 4,
//       name: 'Home Appliances',
//       description: 'Devices and tools for home',
//     ),
//     Catigory(
//       id: 5,
//       name: 'Personal Care Products',
//       description: 'Products for skin and hair care',
//     ),
//     Catigory(
//       id: 6,
//       name: 'Large Appliances',
//       description: 'Large household appliances',
//       parentCategoryId: 4,
//     ),
//     Catigory(
//       id: 7,
//       name: 'Small Appliances',
//       description: 'Small household appliances',
//       parentCategoryId: 4,
//     ),
//   ];

//   // Products with complete details
//   static List<Product> products = [
//     Product(
//       id: 1,
//       sku: 'MOB-001',
//       name: 'Smartphone X10',
//       description: 'High-spec smartphone with advanced camera',
//       price: 2999.99,
//       barcode: '123456789012',
//       imageUrl: 'assets/images/GalaxyX.png',
//       weight: 0.18,
//       dimensions: '15x7x0.8 cm',
//       categoryId: 3,
//       stock: 50,
//       isActive: true,
//       createdAt: DateTime(2023, 1, 15),
//     ),
//     Product(
//       id: 2,
//       sku: 'AUD-001',
//       name: 'Bluetooth Headphones Pro',
//       description: 'Wireless headphones with high sound quality',
//       price: 499.99,
//       barcode: '123456789013',
//       imageUrl: 'assets/images/Headphones.png',
//       weight: 0.25,
//       dimensions: '18x15x4 cm',
//       categoryId: 3,
//       stock: 30,
//       createdAt: DateTime(2023, 2, 10),
//     ),
//     Product(
//       id: 3,
//       sku: 'LAP-001',
//       name: 'Ultra Slim Laptop',
//       description: 'Lightweight laptop with high specs',
//       price: 4599.99,
//       barcode: '123456789014',
//       imageUrl: 'assets/images/LapBook.png',
//       weight: 1.2,
//       dimensions: '31x21x1.5 cm',
//       categoryId: 2,
//       stock: 15,
//       createdAt: DateTime(2023, 3, 5),
//     ),
//     Product(
//       id: 4,
//       sku: 'HOM-001',
//       name: 'Fast Blender',
//       description: '1000W blender for all purposes',
//       price: 349.99,
//       barcode: '123456789015',
//       imageUrl: 'assets/images/Blender.png',
//       weight: 3.5,
//       dimensions: '20x20x40 cm',
//       categoryId: 7,
//       stock: 25,
//       createdAt: DateTime(2023, 1, 20),
//     ),
//     Product(
//       id: 5,
//       sku: 'HOM-002',
//       name: '20-Cubic Foot Refrigerator',
//       description: 'High-spec energy-saving refrigerator',
//       price: 5999.99,
//       barcode: '123456789016',
//       imageUrl: 'assets/images/Refrigator.png',
//       weight: 85.0,
//       dimensions: '180x70x70 cm',
//       categoryId: 6,
//       stock: 8,
//       createdAt: DateTime(2023, 2, 15),
//     ),
//     Product(
//       id: 6,
//       sku: 'BEA-001',
//       name: 'Natural Shampoo',
//       description: 'Shampoo made from natural ingredients for hair care',
//       price: 59.99,
//       barcode: '123456789017',
//       imageUrl: 'assets/images/Shambo.png',
//       weight: 0.4,
//       dimensions: '8x5x20 cm',
//       categoryId: 5,
//       stock: 100,
//       createdAt: DateTime(2023, 3, 1),
//     ),
//     Product(
//       id: 7,
//       sku: 'BEA-002',
//       name: 'Moisturizing Cream',
//       description: 'Daily cream for skin care and hydration',
//       price: 79.99,
//       barcode: '123456789018',
//       imageUrl: 'assets/images/Cream.png',
//       weight: 0.3,
//       dimensions: '6x6x10 cm',
//       categoryId: 5,
//       stock: 80,
//       createdAt: DateTime(2023, 3, 10),
//     ),
//   ];

//   // Customers
//   static List<Customer> customers = [
//     Customer(
//       id: 1,
//       firstName: 'Ahmed',
//       lastName: 'Mohammed',
//       email: 'ahmed@example.com',
//       registrationDate: DateTime(2023, 1, 5),
//     ),
//     Customer(
//       id: 2,
//       firstName: 'Sara',
//       lastName: 'Ali',
//       email: 'sara@example.com',
//       registrationDate: DateTime(2023, 2, 12),
//     ),
//     Customer(
//       id: 3,
//       firstName: 'Khaled',
//       lastName: 'Abdullah',
//       email: 'khaled@example.com',
//       registrationDate: DateTime(2023, 3, 8),
//     ),
//   ];

//   // Orders
//   static List<Order> orders = [
//     Order(
//       orderId: 1,
//       customerId: 1,
//       items: [
//         OrderItem(productId: 1, quantity: 1, unitPrice: 2999.99),
//         OrderItem(productId: 2, quantity: 2, unitPrice: 499.99),
//       ],
//       totalAmount: 3999.97,
//       shippingAddress: '123 Riyadh Street, Riyadh, Saudi Arabia',
//       paymentMethod: 'Credit Card',
//       shippingStatus: 'Delivered',
//       trackingNumber: 'TRK123456789',
//       notes: 'Delivery before 5 PM',
//       orderDate: DateTime(2023, 2, 15),
//     ),
//     Order(
//       orderId: 2,
//       customerId: 2,
//       items: [
//         OrderItem(productId: 6, quantity: 3, unitPrice: 59.99),
//         OrderItem(productId: 7, quantity: 2, unitPrice: 79.99),
//       ],
//       totalAmount: 339.95,
//       shippingAddress: '456 Jeddah Street, Jeddah, Saudi Arabia',
//       paymentMethod: 'PayPal',
//       shippingStatus: 'Shipped',
//       trackingNumber: 'TRK987654321',
//       orderDate: DateTime(2023, 3, 5),
//     ),
//     Order(
//       orderId: 3,
//       customerId: 3,
//       items: [
//         OrderItem(productId: 3, quantity: 1, unitPrice: 4599.99),
//         OrderItem(productId: 5, quantity: 1, unitPrice: 5999.99),
//       ],
//       totalAmount: 10599.98,
//       shippingAddress: '789 Dammam Street, Dammam, Saudi Arabia',
//       paymentMethod: 'COD',
//       shippingStatus: 'Processing',
//       notes: 'Call before delivery',
//       orderDate: DateTime(2023, 3, 20),
//     ),
//   ];

//   // Function to get products by category
//   static List<Product> getProductsByCategory(int categoryId) {
//     return products.where((p) => p.categoryId == categoryId).toList();
//   }

//   // Function to get all mock products
//   static List<Product> getAllMockProducts() {
//     return products.toList();
//   }

//   // Function to get subcategories
//   static List<Catigory> getSubCategories(int? parentId) {
//     return categories.where((c) => c.parentCategoryId == parentId).toList();
//   }

//   // Function to get customer orders
//   static List<Order> getCustomerOrders(int customerId) {
//     return orders.where((o) => o.customerId == customerId).toList();
//   }
// }
