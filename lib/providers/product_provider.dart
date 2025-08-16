import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:store_app/repositories/product_repository.dart';
import 'package:store_app/services/internet_ckeck_connection.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final ProductRepository productRepository;
  List<Product> _products = [];
  bool _isLoading = false;
  String? _error;
  final Logger _logger = Logger();

  ProductProvider({required this.productRepository});

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;
  Future<void> fetchProducts() async {
    if (_isLoading) return; // منع التحميل إذا كان جارياً بالفعل

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _logger.i('Starting products fetch...');
      final isConnected = await checkInternetConnection();

      if (isConnected) {
        _logger.i('Fetching fresh data from API...');
        _products = await productRepository.fetchProducts();
        _logger.i('Successfully fetched ${_products.length} products');
      } else {
        _logger.w('No internet - using mock data');
        _error = "No Internet Connection";
        _products = mockProducts;
      }
    } catch (e) {
      _logger.e('Error in fetchProducts: $e');
      _error = "Failed to load products";
      _products = mockProducts;
    } finally {
      _isLoading = false;
      notifyListeners();
      _logger.i('Products fetch completed');
    }
  }
}
