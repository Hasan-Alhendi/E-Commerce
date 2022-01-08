// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_language_project/control/controllers/product_search_controller.dart';
import 'package:programming_language_project/control/controllers/products_controller.dart';
import 'package:programming_language_project/model/classes/product.dart';

import '../../routs.dart';

class ProductItemSearch extends GetView<ProductSearchController> {
  ProductItemSearch(
      {required this.id,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.onChanged,
      required this.product,
      Key? key})
      : super(key: key);
  final ValueChanged<String> onChanged;
  final imageUrl;
  final title;
  final price;
  final id;
  final Product product;
  ProductsController p = Get.put(ProductsController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.productDetail, arguments: id as String);
            p.quantityAdd(product);
          },
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            subtitle: Text(
              '$price s.p',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              backgroundImage: NetworkImage(
                imageUrl,
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
