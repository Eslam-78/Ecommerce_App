import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:store_app/models/customer.dart';

class CustomerRepository {
  final String baseUrl = "http://192.168.0.125:5058/api";
  final Logger _logger = Logger();

  Future<Customer> login(String email) async {
    try {
      _logger.i('Attempting login for email: $email');
      final response = await http.post(
        Uri.parse('$baseUrl/customers/login'),
        body: json.encode({'email': email}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log("RAW response: ${response.body}");
        _logger.i('Login successful');
        final jsonData = json.decode(response.body);
        _logger.d('Customer data: $jsonData');
        return Customer.fromJson(jsonData['customer']);
      } else if (response.statusCode == 401) {
        _logger.e('Email does not exist');
        throw Exception('Your Email Does not exist!');
      } else {
        _logger.e('Login failed. Status code: ${response.statusCode}');
        throw Exception('Login failed');
      }
    } catch (e) {
      _logger.e('Exception during login: $e');
      rethrow;
    }
  }
}
