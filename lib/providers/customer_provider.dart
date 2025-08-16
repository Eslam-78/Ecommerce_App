import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:store_app/models/customer.dart';
import 'package:store_app/repositories/customer_repository.dart';

class CustomerProvider with ChangeNotifier {
  final CustomerRepository customerRepository;
  Customer? _customer;
  bool _isLoading = false;
  String? _error;
  final Logger _logger = Logger();

  CustomerProvider({required this.customerRepository});

  Customer? get customer => _customer;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isLoggedIn => _customer != null;
  int? get customerId => customer!.customerID;

  void clearError() {
    _error = null;
  }

  Future<void> login(String email) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    _logger.i('Starting login process...');

    try {
      _logger.i('Authenticating user...');
      _customer = await customerRepository.login(email);
      _logger.i('User authenticated successfully');
    } catch (e) {
      _logger.e('Login error: $e');
      _error = e.toString();
      _customer = null;
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
      _logger.i('Login process completed');
    }
  }

  void logout() {
    _logger.i('Logging out user: ${_customer?.email}');
    _customer = null;
    notifyListeners();
    _logger.i('User logged out');
  }
}
