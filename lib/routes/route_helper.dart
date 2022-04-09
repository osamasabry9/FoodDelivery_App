// ignore_for_file: unnecessary_string_interpolations

import 'package:food_delivery_app/Pages/cart/cart_page.dart';
import 'package:food_delivery_app/Pages/food/popular_food_detail.dart';
import 'package:food_delivery_app/Pages/food/recommended_food_detail.dart';
import 'package:get/get.dart';
import '../Pages/home/main_food_page.dart';

class RouteHelper {
  static const initial = '/';
  static const popularFood = '/popular-food';
  static const recommendedFood = '/recommended_food';
  static const cartPage = '/cart-page';

// static const products = Routes.products;
// static const productDetails = Routes.productDetails;
// static const insertProduct = Routes.insertProduct;
// static const register = Routes.register;
// static const login = Routes.login;

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';
  static String getCartPage() => '$cartPage';

  static final routes = [
    GetPage(
      name: initial,
      page: () => const MainFoodPage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetail(
          pageId: int.parse(pageId!),
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return RecommendedFoodDetail(
          pageId: int.parse(pageId!),
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () => const CartPage(),
      transition: Transition.fadeIn,
    ),
  ];
}


// class Routes {
//   // static const initial = '/';
//   // static const products = '/products';
//   // static const productDetails = '/product_details';
//   // static const insertProduct = '/insert_product';
//   // static const register = '/register';
//   // static const login = '/login';
// }