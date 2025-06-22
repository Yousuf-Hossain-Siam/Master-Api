import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'imageToText_model.dart';

class ImageToTextApi {
  static const String baseurl = 'https://api.api-ninjas.com/v1/imagetotext';
  static const String apiKey = 'ap2lVxBA63pNndu73iD1xQ==bVenuH3Lc7WRIyC0';

  static Future<List<ImageToTextModel>> fetchImageToTextData(File imageFile) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(baseurl));
      request.headers['X-Api-Key'] = apiKey;

      request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

      var response = await request.send();
      final respStr = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final List jsonData = json.decode(respStr);
        return jsonData.map((e) => ImageToTextModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed: ${response.statusCode}, $respStr');
      }
    } catch (e) {
      rethrow;
    }
  }
}
