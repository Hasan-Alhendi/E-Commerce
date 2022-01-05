// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_language_project/control/controllers/products_controller.dart';
import 'package:programming_language_project/routs.dart';

class ProductItem extends GetView<ProductsController> {
  const ProductItem({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.product,
    required this.viewCount,
  });
  //final Product product;
  final id;
  final imageUrl;
  final title;
  final product;
  final int? viewCount;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      //to round image
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.productDetail, arguments: id as String);
            controller.quantityAdd(product);
          },
          child: Hero(
            tag: id,
            child: FadeInImage(
              placeholder:
                  const AssetImage('assets/images/product-placeholder.png'),
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
              onPressed: () => controller.favourite(product),
              icon: Obx(() => Icon(
                  product.isFavourite.value == true
                      ? Icons.thumb_up
                      : Icons.thumb_up_alt_outlined,
                  color: Colors.white))),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11),
          ),
          trailing: Row(
            children: [
              const Icon(
                Icons.remove_red_eye_outlined,
                size: 10,
              ),
              const SizedBox(
                width: 3,
              ),
              Obx(
                () => Text(
                  '${product.cnt} view',
                  style: const TextStyle(color: Colors.white, fontSize: 8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //jijj
  }
}
