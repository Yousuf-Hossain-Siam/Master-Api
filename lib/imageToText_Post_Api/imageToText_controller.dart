import 'package:food_api/imageToText_Post_Api/imageToText_api.dart';
import 'package:food_api/imageToText_Post_Api/imageToText_model.dart';
import 'package:get/get.dart';
import 'dart:io';

class ImageToTextController extends GetxController {
  RxList<ImageToTextModel> imageToTextList = <ImageToTextModel>[].obs;
  RxBool isLoading = false.obs;

  // You need to pass the image file to fetch data, so modify fetch method to accept File
  Future<void> fetchImageToText(File imageFile) async {
    try {
      isLoading.value = true;
      final data = await ImageToTextApi.fetchImageToTextData(imageFile);
      imageToTextList.assignAll(data);
    } catch (e, stackTrace) {
      print("Stack trace: $stackTrace");
      if (Get.context != null) {
        Get.snackbar("Error", e.toString());
      }
    } finally {
      isLoading.value = false;
    }
  }
}
