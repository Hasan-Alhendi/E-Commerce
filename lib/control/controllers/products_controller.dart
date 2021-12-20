// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:programming_language_project/model/classes/product.dart';
import 'package:programming_language_project/model/classes/products.dart';
import 'package:programming_language_project/model/services/products_services.dart';

class ProductsController extends GetxController {
  var isLoading = true.obs;
  List<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    print("---intilize pductsController---");
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    // print(Products.items);
    try {
      isLoading(true);
      List<Product> products = await ProductsServices.fetchProducts();

      // ignore: unnecessary_null_comparison
      if (products != null) {
        productList = products;
      }
      // print(productList[0].commInfo);
    } finally {
      isLoading(false);
    }
  }
}
