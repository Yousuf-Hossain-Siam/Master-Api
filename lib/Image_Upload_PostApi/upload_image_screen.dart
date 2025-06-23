// Screen file: upload_image_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_api/Image_Upload_PostApi/upload_image_controller.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImageScreen extends StatelessWidget {
  const UploadImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    final UploadImageController controller = Get.put(UploadImageController());

    return Obx(() => ModalProgressHUD(
      inAsyncCall: controller.showSpinner.value,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.cyan,
          title: const Text('Upload Image Api'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => controller.getImage(),
              child: Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: controller.image.value == null
                      ? const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
                              SizedBox(height: 10),
                              Text('Pick Image'),
                            ],
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            controller.image.value!,
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Clear image button (if image is selected)
            if (controller.image.value != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () => controller.clearImage(),
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Clear Image",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 50),
            
            // Upload button
            GestureDetector(
              onTap: () => controller.uploadImage(),
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: controller.image.value != null 
                      ? Colors.green 
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "Upload",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
