import 'package:flutter/material.dart';
import 'package:food_delivery_app/Pages/home/main_food_page.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:get/get.dart';
import 'Pages/cart/cart_page.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
      //initialBinding: BandingHelp(),
      debugShowCheckedModeBanner: false,
      home: const MainFoodPage(),
    );
  }
}
