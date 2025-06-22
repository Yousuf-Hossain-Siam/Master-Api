import 'package:flutter/material.dart';
import 'package:food_api/Dog_Api/dog_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';

class DogScreen extends StatelessWidget {
  DogScreen({super.key});

  final DogController controller = Get.put(DogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 218, 66, 42),
        centerTitle: true,
        title: Text(
          "Dog Api",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.dogList.length,
            itemBuilder: (context, index) {
              final dog = controller.dogList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40.0,
                  horizontal: 30,
                ),
                child: Container(
                  height: 300,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.redAccent,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(dog.imageLink ?? ''),
                        ),
                      ),
                      Text(
                        "Name: ${dog.name ?? "_"}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Good With Children: ${dog.goodWithChildren ?? "_"}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Good With Other Dogs: ${dog.goodWithOtherDogs ?? "_"}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                       Text(
                        "Min Life Expectancy: ${dog.minLifeExpectancy ?? "_"}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Max Life Expectancy: ${dog.maxLifeExpectancy ?? "_"}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
