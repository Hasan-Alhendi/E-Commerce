// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:programming_language_project/model/classes/product.dart';
import 'package:programming_language_project/model/classes/products.dart';

class ProductEditController extends GetxController {
  var isLoading = true.obs;
  List<Product> productList = <Product>[].obs;
  final List<Product> loadedProduct = Products.itemsByUser('sfssr45');

  @override
  void onInit() {
    print("---intilize ProductEditController---");
    fetchProducts();

    super.onInit();
  }

  void fetchProducts() {
    try {
      isLoading(true);
      List<Product> products = Products.itemsByUser('sfsjfklsfj');

      // ignore: unnecessary_null_comparison
      if (products != null) {
        productList = products;
      }

      print(productList[0]);
    } finally {
      isLoading(false);
    }
  }
}
