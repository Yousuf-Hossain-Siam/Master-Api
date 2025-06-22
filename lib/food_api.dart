import 'dart:convert';
import 'package:food_api/food_model.dart';
import 'package:http/http.dart' as http;

class FoodApi {
  static const String baseurl = 'https://api.api-ninjas.com/v1/nutrition?query=1lb brisket and fries';
  static const String apiKey = 'ap2lVxBA63pNndu73iD1xQ==bVenuH3Lc7WRIyC0';

  static Future<List<FoodModel>> fetchFoodData() async {
    try {
      final response = await http.get(
        Uri.parse(baseurl),
        headers: {
          'X-Api-Key': apiKey,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List jsonData = json.decode(response.body);
        return jsonData.map((e) => FoodModel.fromJson(e)).toList();
       
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
 
      }
    } catch (e, stackTrace) {
          print('Stack trace: $stackTrace');
          rethrow;
    }
  }
}
