import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:store_app/models/product.dart';

class ProductRepository {
  final String baseUrl = "http://192.168.0.125:5058/api";
  final Logger _logger = Logger();

  Future<List<Product>> fetchProducts() async {
    try {
      _logger.i('Fetching products from API...');
      final response = await http.get(
        Uri.parse('$baseUrl/products'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log("RAW response: ${response.body}"); // هنا ترى الرد الخام
        final List<dynamic> jsonData = json.decode(response.body);
        _logger.d('Products data received: ${jsonData.length} items');
        return jsonData.map((item) => Product.fromJson(item)).toList();
      } else {
        _logger.e(
          'Failed to load products - Status code: ${response.statusCode}',
        );
        throw Exception('Failed to load products');
      }
    } catch (e) {
      _logger.e('Exception in fetchProducts: $e');
      rethrow;
    }
  }
}
