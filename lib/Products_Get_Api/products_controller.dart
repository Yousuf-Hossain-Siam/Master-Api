
import 'package:food_api/Products_Get_Api/products_api.dart';
import 'package:food_api/Products_Get_Api/products_model.dart';
import 'package:get/get.dart';

import 'package:food_api/food_api.dart';

class ProductsController extends GetxController {
  RxList<ProductsModel> productslist = <ProductsModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    fetchDog();
    super.onInit();
  }

  void fetchDog() async {
    try {
      isLoading.value = true;
      final data = await ProductsApi.fetchProductsData();
      productslist.assignAll(data);
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
