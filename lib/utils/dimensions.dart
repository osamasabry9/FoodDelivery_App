import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

//screenHeight = 731
//screenWedth = 412
  static double pageView = screenHeight / 2.64; //440
  static double pageViewContainer = screenHeight / 3.84; //220
  static double pageViewTextContainer = screenHeight / 7.03; //120

  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height24 = screenHeight / 35.17;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;

  static double width10 = screenWidth / 84.4;
  static double width15 = screenWidth / 56.27;
  static double width20 = screenWidth / 42.2;
  static double width30 = screenWidth / 28.13;
  static double width45 = screenWidth / 18.76;
  static double width120 = screenWidth / 3.25;

// Font Size
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

// radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  // icon Size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;
  // list view size
  static double lisetViewImgSize120 = screenWidth / 3.25;
  static double lisetViewTextSize100 = screenWidth / 3.9;

// Popular food
  static double popularFoodImgSize = screenHeight / 2.41;
}
