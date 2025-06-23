// Controller file: upload_image_controller.dart
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadImageController extends GetxController {
  // Observable variables
  Rx<File?> image = Rx<File?>(null);
  RxBool showSpinner = false.obs;
  
  final ImagePicker _picker = ImagePicker();

  // Pick image from gallery
  Future<void> getImage() async {
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery, 
        imageQuality: 80
      );

      if (pickedFile != null) {
        image.value = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  // Upload image to server
  Future<void> uploadImage() async {
    if (image.value == null) {
      Get.snackbar('Error', 'Please select an image first');
      return;
    }

    try {
      showSpinner.value = true;

      var stream = http.ByteStream(image.value!.openRead());
      stream.cast();

      var length = await image.value!.length();
      var uri = Uri.parse('https://fakestoreapi.com/products');
      var request = http.MultipartRequest('POST', uri);

      request.fields['title'] = 'Static title';

      var multiport = http.MultipartFile('image', stream, length);
      request.files.add(multiport);

      var response = await request.send();

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
        Get.snackbar('Success', 'Image uploaded successfully');
      } else {
        print('Upload failed with status: ${response.statusCode}');
        Get.snackbar('Error', 'Failed to upload image');
      }
    } catch (e) {
      print('Upload error: $e');
      Get.snackbar('Error', 'Upload failed: $e');
    } finally {
      showSpinner.value = false;
    }
  }

  // Clear selected image
  void clearImage() {
    image.value = null;
  }
}