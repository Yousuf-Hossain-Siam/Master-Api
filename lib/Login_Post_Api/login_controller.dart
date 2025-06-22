import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  // No need to make controllers observable
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool loading = false.obs;

  void loginApi() async {
    loading.value = true;

    try {
      Map<String, dynamic> newData = {
        'email': emailController.text,
        'password': passwordController.text,
      };

      final response = await http.post(
        Uri.parse('https://luna3server.onrender.com/api/v1/auth/login'),
        body: jsonEncode(newData),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8', // required
        },
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        loading.value = false;
        Get.snackbar('Login Success', 'Token: ${data['token']}');
      } else {
        loading.value = false;
         String errorMessage = data['error'] ?? 'Unknown Error';
        Get.snackbar('Login Failed', data['error']);
        Get.snackbar('Login Failed', errorMessage);

      }
    } catch (e) {
      loading.value = false;
      Get.snackbar('Exception', e.toString());
    }
  }
}




