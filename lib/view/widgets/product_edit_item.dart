// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_language_project/control/controllers/product_edit_controller.dart';

class ProductEditItem extends GetView<ProductEditController> {
  const ProductEditItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.id,
  }) : super(key: key);

  final imageUrl;
  final title;
  final price;
  final id;
  //ProductEditController dd=Get.find<ProductEditController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          trailing: SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    // color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.deleteddd(id);
                  },
                  icon: const Icon(
                    Icons.delete,
                    // color: Colors.white,
                  ),
                )
              ],
            ),
          ),
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
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
