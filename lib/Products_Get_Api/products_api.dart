import 'dart:convert';
import 'package:food_api/Products_Get_Api/products_model.dart';

import 'package:http/http.dart' as http;

class ProductsApi {
  static const String baseurl = 'https://fakestoreapi.com/products';


  static Future<List<ProductsModel>> fetchProductsData() async {
    try {
      final response = await http.get(
        Uri.parse(baseurl),
        headers: {
         
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List jsonData = json.decode(response.body);
        return jsonData.map((e) => ProductsModel.fromJson(e)).toList();
       
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
 
      }
    } catch (e, stackTrace) {
          print('Stack trace: $stackTrace');
          rethrow;
    }
  }
}
