// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_language_project/routs.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {required this.id, required this.imageUrl, required this.title});
  //final Product product;
  final id;
  final imageUrl;
  final title;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      //to round image
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.productDetail, arguments: id as String);
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
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
