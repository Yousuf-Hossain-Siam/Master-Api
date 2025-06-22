import 'package:get/get.dart';
import 'package:food_api/food_model.dart';
import 'package:food_api/food_api.dart';

class FoodController extends GetxController {
  RxList<FoodModel> foodList = <FoodModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    fetchFood();
    super.onInit();
  }

  void fetchFood() async {
    try {
      isLoading.value = true;
      final data = await FoodApi.fetchFoodData();
      foodList.assignAll(data);
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
