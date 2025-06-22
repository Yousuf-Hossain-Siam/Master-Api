import 'package:food_api/Dog_Api/dog_api.dart';
import 'package:food_api/Dog_Api/dog_model.dart';
import 'package:get/get.dart';

import 'package:food_api/food_api.dart';

class DogController extends GetxController {
  RxList<DogModel> dogList = <DogModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    fetchDog();
    super.onInit();
  }

  void fetchDog() async {
    try {
      isLoading.value = true;
      final data = await DogApi.fetchDogData();
      dogList.assignAll(data);
    } catch (e, stackTrace) {
        print("Stack trace: $stackTrace");
        if(Get.context != null){
  Get.snackbar("Error", e.toString());
        }
    
    } finally {
      isLoading.value = false;
    }
  }
}
