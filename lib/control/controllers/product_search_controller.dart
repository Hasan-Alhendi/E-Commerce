import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_language_project/model/classes/product.dart';
import 'package:programming_language_project/model/classes/products.dart';

class ProductSearchController extends GetxController {
  TextEditingController searchController = TextEditingController();
  var productList = <Product>[].obs;
  var productTempList = <Product>[];

  @override
  void onInit() {
    var productData = Products.items;
    //Store data
    productList.value = productData;
    productTempList = productData;
    super.onInit();
  }

  void searchProduct(String query) {
    if (query.isEmpty) {
      productList.value = productTempList;
    } else {
      productList.value = productTempList.where((product) {
        final titleLower = product.title!.toLowerCase();
        final price = product.price.toString().toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) || price.contains(searchLower);
      }).toList();
    }
  }
}
