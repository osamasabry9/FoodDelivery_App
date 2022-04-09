// import 'package:food_delivery_app/controllers/popular_product_controller.dart';
// import 'package:food_delivery_app/deta/api/api_client.dart';
// import 'package:food_delivery_app/deta/repository/popular_product_repo.dart';
// import 'package:get/get.dart';

// class BandingHelp extends Bindings
// {
//   @override
//   void dependencies() {
//   Get.lazyPut(
//     () => ApiClient(appBaseUrl: 'https://mvs.bslmeiyu.com'),
//   );
//   Get.lazyPut(
//     () => PopularProductRepo(
//       apiClient: ApiClient(
//         appBaseUrl: Get.find(),
//       ),
//     ),
//   );
//   Get.lazyPut(
//     () => PopularProductController(
//       popularProductRepo: Get.find(),
//     ),
//   );    
//   }
  
// }