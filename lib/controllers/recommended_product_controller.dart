// ignore_for_file: avoid_print

import 'package:food_delivery_app/models/products_model.dart';
import 'package:get/get.dart';

import '../deta/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController(
      {required this.recommendedProductRepo, popularProductRepo});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    //print('get to response...01');
    if (response.statusCode == 200 || response.statusCode == 201) {
      //print('get to recommended');
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print('Not get to recommended');
    }
  }
}
