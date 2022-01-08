// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_language_project/control/controllers/product_search_controller.dart';
import 'package:programming_language_project/control/controllers/products_controller.dart';
import 'package:programming_language_project/view/widgets/product_item_search.dart';
import 'package:programming_language_project/view/widgets/search_widget.dart';

class ProductSearchView extends GetView<ProductSearchController> {
  ProductSearchView({Key? key}) : super(key: key);
  ProductsController pController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldSearch(
          onChanged: (String query) {
            controller.searchProduct(query);
          },
          textEditingController: controller.searchController,
        ),
        Expanded(
          child: Obx(
            () => ListView.builder(
              itemCount: controller.productList.length,
              itemBuilder: (BuildContext context, int index) =>
                  ProductItemSearch(
                onChanged: controller.searchProduct,
                id: controller.productList[index].id,
                imageUrl: controller.productList[index].imageUrl,
                price: controller.productList[index].price,
                title: controller.productList[index].title,
                product: controller.productList[index],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /* void searchProduct(String query) {
    final products = pController.productList.where((product) {
      final titleLower = product.title!.toLowerCase();
      final price = product.price.toString().toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) || price.contains(searchLower);
    }).toList();

    //this.products = products;
  } */
}
