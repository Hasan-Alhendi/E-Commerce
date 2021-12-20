import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_language_project/control/controllers/product_search_controller.dart';
import 'package:programming_language_project/control/controllers/products_controller.dart';
import 'package:programming_language_project/model/classes/product.dart';
import 'package:programming_language_project/model/classes/products.dart';
import 'package:programming_language_project/view/widgets/search_widget.dart';

class ProductSearchView extends GetView<ProductSearchController> {
  ProductSearchView({Key? key}) : super(key: key);
  ProductsController pController = Get.put(ProductsController());

  static late List<Product> products;
  @override
  Widget build(BuildContext context) {
    print(products);

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) => SearchWidget(
        onChanged: searchProduct,
        id: products[index].id,
        imageUrl: products[index].imageUrl,
        price: products[index].price,
        title: products[index].title,
      ),
    );
  }

  void searchProduct(String query) {
    final products = pController.productList.where((product) {
      final titleLower = product.title!.toLowerCase();
      final price = product.price.toString().toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) || price.contains(searchLower);
    }).toList();

    //this.products = products;
  }
}
