import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../widgets/app_column.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        //print('Current Vlaue is ' + _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider Section
        GetBuilder<PopularProductController>(
          builder: (controller) {
            return controller.isLoaded
                ? SizedBox(
                    //color: Colors.red,
                    height: Dimensions.pageView,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: controller.popularProductList.isEmpty
                          ? 1
                          : controller.popularProductList.length,
                      itemBuilder: (context, index) {
                        return _bulidPageItem(
                            index, controller.popularProductList[index]);
                      },
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColor,
                    ),
                  );
          },
        ),
        // dots
        GetBuilder<PopularProductController>(
          builder: (controller) => DotsIndicator(
            dotsCount: controller.popularProductList.isEmpty
                ? 1
                : controller.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ),
        // Popular Text
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: '.  '),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food pairing'),
              ),
            ],
          ),
        ),
        //List of food and images
        GetBuilder<RecommendedProductController>(
          builder: (recommendedcontroller) {
            return recommendedcontroller.isLoaded
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        recommendedcontroller.recommendedProductList.length,
                    itemBuilder: (context, index) {
                      return _bulidListFoodItems(
                        index,
                        recommendedcontroller.recommendedProductList[index],
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColor,
                    ),
                  );
          },
        ),
      ],
    );
  }

  Widget _bulidPageItem(int index, ProductsModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(RouteHelper.getPopularFood(index));
          },
          child: Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.height30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: DecorationImage(
                  image: NetworkImage(
                    AppConstants.UBLOADS_URL + popularProduct.img!,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.height20),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0, 5),
                ),
                BoxShadow(
                  color: Colors.white,
                  //blurRadius: 5.0,
                  offset: Offset(-5, 0),
                ),
                BoxShadow(
                  color: Colors.white,
                  //blurRadius: 5.0,
                  offset: Offset(5, 0),
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.only(
                top: Dimensions.height15,
                left: Dimensions.width15,
                right: Dimensions.width15,
              ),
              child: AppColumn(
                text: popularProduct.name!,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _bulidListFoodItems(int index, ProductsModel recommendedProduct) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteHelper.getRecommendedFood(index)),
      child: Container(
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
                borderRadius: BorderRadius.circular(Dimensions.height20),
                color: Colors.white38,
                image: DecorationImage(
                    image: NetworkImage(
                      AppConstants.UBLOADS_URL + recommendedProduct.img!,
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
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: recommendedProduct.name!),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      SmallText(
                        text: recommendedProduct.description!,
                        maxline: 1,
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          IconAndText(
                            icon: Icons.circle_sharp,
                            text: 'Normal',
                            iconColor: AppColors.iconColor1,
                          ),
                          IconAndText(
                            icon: Icons.location_on,
                            text: '1.7Km',
                            iconColor: AppColors.mainColor,
                          ),
                          IconAndText(
                            icon: Icons.access_time_rounded,
                            text: '32min',
                            iconColor: AppColors.iconColor2,
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
      ),
    );
  }
}
