import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  // onTap: () => Get.toNamed(RouteHelper.initial),
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconsize: Dimensions.iconSize24,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Get.toNamed(RouteHelper.initial),
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconsize: Dimensions.iconSize24,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width30,
                ),
                Stack(
                  children: [
                    AppIcon(
                      icon: Icons.shopping_cart_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconsize: Dimensions.iconSize24,
                    ),
                    // Get.find<PopularProductController>().totalItems >= 1
                    //     ? const Positioned(
                    //         right: 0,
                    //         top: 0,
                    //         child: AppIcon(
                    //           icon: Icons.circle,
                    //           size: 20,
                    //           iconColor: Colors.transparent,
                    //           backgroundColor: AppColors.mainColor,
                    //         ),
                    //       )
                    //     : Container(),
                    // Get.find<PopularProductController>().totalItems >= 1
                    //     ? Positioned(
                    //         right: 5,
                    //         top: 3,
                    //         child: BigText(
                    //           text: Get.find<PopularProductController>()
                    //               .totalItems
                    //               .toString(),
                    //           size: 12,
                    //           color: Colors.white,
                    //         ))
                    //     : Container(),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 6,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              //color: Colors.red,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(
                  builder: (carController) {
                    return ListView.builder(
                      itemCount: carController.getItems.length,
                      itemBuilder: (context, index) {
                        return _bulidListFoodItems(
                          index,
                          carController.getItems[index],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.pageViewTextContainer,
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.height30,
          horizontal: Dimensions.width20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
          color: AppColors.buttonBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.height20,
                horizontal: Dimensions.width45,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.radius20,
                ),
                color: Colors.white,
              ),
              child: BigText(
                text: "\$ 0.0 ",
                color: Colors.black,
              ),
            ),
            GestureDetector(
              // onTap: () => productController.addItem(product),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height20,
                  horizontal: Dimensions.width30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius20,
                  ),
                  color: AppColors.mainColor,
                ),
                child: BigText(
                  text: "Check Out ",
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bulidListFoodItems(
    int index,
    CartModel cartProduct,
  ) {
    return Container(
      //color: Colors.black,
      width: double.maxFinite,
      height: Dimensions.lisetViewImgSize120,
      margin: EdgeInsets.only(
        right: Dimensions.width20,
        left: Dimensions.width20,
        bottom: Dimensions.height10,
      ),
      child: Row(
        children: [
          // image section
          Container(
            width: Dimensions.lisetViewImgSize120,
            height: Dimensions.lisetViewImgSize120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white38,
              image: DecorationImage(
                  image: NetworkImage(
                    AppConstants.UBLOADS_URL + cartProduct.img!,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          // text Container
          Expanded(
            child: Container(
              height: Dimensions.lisetViewTextSize100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.height20),
                  bottomRight: Radius.circular(Dimensions.height20),
                ),
                color: const Color.fromARGB(95, 248, 247, 247),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: cartProduct.name!,
                      color: Colors.black54,
                    ),
                    SmallText(
                      text: 'Spicy',
                      maxline: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: " \$ " + cartProduct.price.toString(),
                          color: Colors.redAccent,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height20,
                            horizontal: Dimensions.width20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius20,
                            ),
                            color: Colors.white,
                          ),
                          child: GetBuilder<CartController>(
                            builder: (_cartController) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => _cartController.addItem(
                                      cartProduct.product!, -1),
                                  child: const Icon(
                                    Icons.remove,
                                    color: AppColors.signColor,
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                BigText(text: cartProduct.quantity.toString()
                                    // productController.inCartItems.toString(),
                                    ),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                GestureDetector(
                                  onTap: () => _cartController.addItem(
                                      cartProduct.product!, 1),
                                  child: const Icon(
                                    Icons.add,
                                    color: AppColors.signColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
