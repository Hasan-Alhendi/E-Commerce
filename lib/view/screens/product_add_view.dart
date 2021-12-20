import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_language_project/control/controllers/product_add_controller.dart';
import 'package:programming_language_project/view/widgets/product_add_item.dart';

class ProductAddView extends GetView<ProductAddController> {
  const ProductAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProductAddItem(),
    );
  }
}
