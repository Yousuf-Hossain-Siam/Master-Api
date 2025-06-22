import 'dart:convert';
import 'package:food_api/Dog_Api/dog_model.dart';

import 'package:http/http.dart' as http;

class DogApi {
  static const String baseurl = 'https://api.api-ninjas.com/v1/dogs?name=golden retriever';
  static const String apiKey = 'ap2lVxBA63pNndu73iD1xQ==bVenuH3Lc7WRIyC0';

  static Future<List<DogModel>> fetchDogData() async {
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
        return jsonData.map((e) => DogModel.fromJson(e)).toList();
       
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
 
      }
    } catch (e, stackTrace) {
          print('Stack trace: $stackTrace');
          rethrow;
    }
  }
}
