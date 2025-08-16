import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:store_app/models/category.dart';
import 'package:logger/logger.dart';

class CategoryRepository {
  final String baseUrl = "http://192.168.0.125:5058/api";
  final Logger _logger = Logger();

  Future<List<Catigory>> fetchCategories() async {
    try {
      _logger.i('Fetching categories from API...');
      final response = await http.get(Uri.parse('$baseUrl/categories'));

      if (response.statusCode == 200 || response.statusCode == 201) {
        log("RAW response: ${response.body}"); // هنا ترى الرد الخام
        _logger.i('Categories fetched successfully');
        List jsonData = json.decode(response.body);
        _logger.d('Categories data: $jsonData');
        return jsonData.map((item) => Catigory.fromJson(item)).toList();
      } else {
        _logger.e(
          'Failed to load categories. Status code: ${response.statusCode}',
        );
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      _logger.e('Exception while fetching categories: $e');
      rethrow;
    }
  }
}
