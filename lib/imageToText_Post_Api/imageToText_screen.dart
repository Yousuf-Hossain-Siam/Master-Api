import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_api/imageToText_Post_Api/imageToText_controller.dart';
import 'package:get/get.dart';

class ImageToTextScreen extends StatelessWidget {
  ImageToTextScreen({super.key});

  final ImageToTextController controller = Get.put(ImageToTextController());

  // Pick image and send to API
  Future<void> _pickImageAndSend() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final File image = File(pickedFile.path);
      await controller.fetchImageToText(image);
    } else {
      Get.snackbar("No Image", "You didn't select any image",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 204, 105),
        centerTitle: true,
        title: const Text(
          "Image To Text API",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImageAndSend,
        backgroundColor: Colors.orange,
        child: const Icon(Icons.image),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.imageToTextList.isEmpty) {
          return const Center(child: Text("No text detected."));
        } else {
          return ListView.builder(
            itemCount: controller.imageToTextList.length,
            itemBuilder: (context, index) {
              final item = controller.imageToTextList[index];
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.text ?? "No text found",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (item.boundingBox != null)
                          Text(
                            "Bounding Box:\n"
                            "x1: ${item.boundingBox!.x1}, y1: ${item.boundingBox!.y1},\n"
                            "x2: ${item.boundingBox!.x2}, y2: ${item.boundingBox!.y2}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
