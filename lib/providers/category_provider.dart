import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:store_app/repositories/category_repository.dart';
import 'package:store_app/services/internet_ckeck_connection.dart';
import '../models/category.dart';

class CategoryProvider with ChangeNotifier {
  final CategoryRepository categoryRepository;
  List<Catigory> _categories = [];
  bool _isLoading = false;
  String? _error;
  final Logger _logger = Logger();

  CategoryProvider({required this.categoryRepository});

  List<Catigory> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchCategories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _logger.i('Checking internet connection...');
      bool isConnected = await checkInternetConnection();

      if (isConnected) {
        _logger.i('Internet connected, fetching real data...');
        _categories = await categoryRepository.fetchCategories();
        _logger.i('Fetched ${_categories.length} categories');
      } else {
        _logger.w('No internet connection, using mock data');
        _error = "No Internet Connection";
        _categories = mockCategories;
      }
    } catch (e) {
      _logger.e('Error fetching categories: $e');
      _error = "Error happened while uploading categories";
      _categories = mockCategories;
      _logger.w('Using mock data as fallback');
    } finally {
      _isLoading = false;
      notifyListeners();
      _logger.i('Category fetch process completed');
    }
  }
}
