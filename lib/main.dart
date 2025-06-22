import 'package:flutter/material.dart';
import 'package:food_api/Dog_Api/dog_api.dart';
import 'package:food_api/Dog_Api/dog_screen.dart';
import 'package:food_api/Image_Upload_PostApi/upload_image_screen.dart';

import 'package:food_api/Login_Post_Api/login_screen.dart';
import 'package:food_api/Products_Get_Api/Products_screen.dart';
import 'package:food_api/home_screen.dart';
import 'package:food_api/imageToText_Post_Api/imageToText_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: UploadImageScreen(),
    );
  }
}

