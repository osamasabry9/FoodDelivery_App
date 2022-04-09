import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/deta/api/api_client.dart';
import 'package:food_delivery_app/deta/repository/cart_repo.dart';
import 'package:food_delivery_app/deta/repository/popular_product_repo.dart';
import 'package:food_delivery_app/deta/repository/recommended_product_repo.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  /* -------------------------------- Api Client -------------------------------*/
  Get.lazyPut(
    () => ApiClient(appBaseUrl: AppConstants.BASE_URL),
  );

  /* -------------------------------- Repository -------------------------------*/
  Get.lazyPut(
    () => PopularProductRepo(apiClient: Get.find()),
  );
  Get.lazyPut(
    () => RecommendedProductRepo(apiClient: Get.find()),
  );
  Get.lazyPut(
    () => CartRepo(),
    //fenix: true,
  );

  /* -------------------------------- Controller -------------------------------*/
  Get.lazyPut(
    () => PopularProductController(
      popularProductRepo: Get.find(),
    ),
  );
  Get.lazyPut(
    () => RecommendedProductController(
      recommendedProductRepo: Get.find(),
    ),
  );
  Get.lazyPut(
    () => CartController(
      cartRepo: Get.find(),
    ),
    //fenix: true,
  );
}
