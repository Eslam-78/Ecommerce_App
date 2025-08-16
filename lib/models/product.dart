class Product {
  final int productID;
  final String name;
  final double price;
  final int categoryID;
  final String imageURL;
  final String description;

  Product({
    required this.productID,
    required this.name,
    required this.price,
    required this.categoryID,
    required this.imageURL,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productID: (json['productID'] as int?) ?? 0,
      name: (json['name'] as String?) ?? 'Unknown Product',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      categoryID: (json['categoryID'] as int?) ?? 0,
      imageURL: (json['imageURL'] as String?) ?? 'assets/default_product.png',
      description: (json['description'] as String?) ?? 'No description',
    );
  }

  Map<String, dynamic> toJson() => {
    'ProductID': productID,
    'Name': name,
    'Description': description,
    'Price': price,
    'imageURL': imageURL,
    'CategoryID': categoryID,
  };
}

//Mock Data OF Products
List<Product> mockProducts = [
  Product(
    productID: 1,
    name: 'Smartphone X10',
    description: 'High-spec smartphone with advanced camera',
    price: 2999.99,
    imageURL: 'assets/images/GalaxyX.png',
    categoryID: 11,
  ),
  Product(
    productID: 2,
    name: 'Bluetooth Headphones',
    description: 'Wireless headphones with high sound quality',
    price: 499.99,
    categoryID: 6,
    imageURL: "assets/images/Headphones.png",
  ),
  Product(
    productID: 3,
    name: 'Ultra Slim Laptop',
    description: 'Lightweight laptop with high specs',
    price: 4599.99,

    imageURL: 'assets/images/LapBook.png',

    categoryID: 4,
  ),
  Product(
    productID: 4,

    name: 'Fast Blender B-20',
    description: '1000W blender for all purposes',
    price: 349.99,

    imageURL: 'assets/images/Blender.png',

    categoryID: 8,
  ),
  Product(
    productID: 5,

    name: '20-Cubic Refrigerator',
    description: 'High-spec energy-saving refrigerator',
    price: 5999.99,

    imageURL: 'assets/images/Refrigator.png',

    categoryID: 7,
  ),
  Product(
    productID: 6,

    name: 'Natural Shampoo',
    description: 'Shampoo made from natural ingredients for hair care',
    price: 59.99,

    imageURL: 'assets/images/Shambo.png',
    categoryID: 11,
  ),
];
