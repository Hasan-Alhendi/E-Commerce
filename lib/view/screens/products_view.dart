// ignore_for_file: must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_language_project/model/classes/product.dart';
import 'package:programming_language_project/view/widgets/product_item.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//import 'package:programming_language_project/view/widgets/product_item.dart';
import '../../control/controllers/products_controller.dart';
import '../../routs.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
              itemCount: controller.productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) => ProductItem(
                id: controller.productList[index].id,
                imageUrl: controller.productList[index].imageUrl,
                title: controller.productList[index].title,
              ),
            );
          }
        },
      ),

      /*Expanded(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: controller.productList.length,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              itemBuilder: (context, index) {
                return ProductItem(controller.productList[index]);
              },
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            );
          }
        }),
      ),*/
    );
  }
}
