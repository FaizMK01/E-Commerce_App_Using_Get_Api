import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/GetEcommerceModel.dart';

class ApiServices {
  Future<List<Product>> getData() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as Map<String, dynamic>;
        EcommerceModel ecommerceModel = EcommerceModel.fromJson(data);
        return ecommerceModel.products ?? [];
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load data');
    }
  }
}
