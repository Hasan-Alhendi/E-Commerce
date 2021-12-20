import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_language_project/control/controllers/products_controller.dart';
import 'package:programming_language_project/model/classes/product.dart';

class ProductSearchController extends GetxController {
  final texController = TextEditingController().obs;
  ProductsController pController = Get.put(ProductsController());
  final List<Product> products = <Product>[].obs;
}
