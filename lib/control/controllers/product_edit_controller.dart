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

    void deleteProduct(String id) {
      // const url = '';
      final existingProductIndex =
          Products.items.indexWhere((prod) => prod.id == id);
      //Product? existingProduct = Products.items[existingProductIndex];
      //--------------------------------------------
      Products.items.removeAt(existingProductIndex);
      update();
      //--------------------------------------------
      /* final response = await http.delete(Uri.parse(url));
  if (response.statusCode >= 400) {
    Products.set_item(existingProductIndex, existingProduct);
    throw HttpException('Could not delete product.');
  }
  existingProduct = null; */
    }
  }

  int counter = 0;
  void deleteddd(String id) {
    final existingProductIndex =
        Products.items.indexWhere((prod) => prod.id == id);
    Products.items.removeAt(existingProductIndex);
    print(existingProductIndex);
    print(Products.items);
    //update();
  }
}
