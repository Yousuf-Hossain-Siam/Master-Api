import 'package:flutter/material.dart';
import 'package:food_api/food_api.dart';
import 'package:food_api/food_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';

class HomeScreen extends StatelessWidget {
 HomeScreen({super.key});

  final FoodController controller = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: Text("Food Api", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: Obx((){
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
          }else{
            return ListView.builder(
              itemCount: controller.foodList.length,
              itemBuilder: (context, index){
              final food = controller.foodList[index];
              return ListTile(
                title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(food.name ?? "Unknown", style: TextStyle(fontWeight: FontWeight.bold)),
     
       Text("Fat Total: ${food.fatTotalG ?? "_"}"),
       Text("Saturated Fat: ${food.fatSaturatedG ?? "_"}"),
         Text("Sodium Amount: ${food.sodiumMg ?? ""}"),
         Text("Potassium Amount: ${food.potassiumMg ?? ""}"),
           Text("Cholesterol Amount: ${food.cholesterolMg ?? ""}"),
            Text("Carbohydrates Amount: ${food.carbohydratesTotalG ?? ""}"),
            Text("Fiber Amount: ${food.fiberG ?? ""}"),

    ]
                )
              );
            });
          }
      })
    );
  }
}