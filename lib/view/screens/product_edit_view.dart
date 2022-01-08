import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_language_project/control/controllers/product_edit_controller.dart';
import 'package:programming_language_project/view/widgets/product_edit_item.dart';
//import 'package:programming_language_project/view/widgets/product_item.dart';
//import 'package:programming_language_project/model/classes/product.dart';
//import 'package:programming_language_project/model/classes/products.dart';

class ProductEditView extends GetView<ProductEditController> {
  const ProductEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: controller.productList.length,
              itemBuilder: (BuildContext context, int index) => ProductEditItem(
                //id: controller.productList[index].id,
                imageUrl: controller.productList[index].imageUrl,
                title: controller.productList[index].title,
                price: controller.productList[index].price,
                id: controller.productList[index].id,
              ),
            );
          }
        },
      ),
    );
  }
}
