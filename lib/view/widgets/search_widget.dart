import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_language_project/control/controllers/product_search_controller.dart';

import '../../routs.dart';

class SearchWidget extends GetView<ProductSearchController> {
  const SearchWidget(
      {required this.id,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.onChanged,
      Key? key})
      : super(key: key);
  final ValueChanged<String> onChanged;
  final imageUrl;
  final title;
  final price;
  final id;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 42,
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(color: Colors.black26),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            controller: controller.texController.value,
            decoration: const InputDecoration(
              icon: Icon(Icons.search, color: Colors.amber),
              hintText: 'widget.hintText',
              border: InputBorder.none,
            ),
            onChanged: onChanged,
          ),
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.productDetail, arguments: id as String);
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
        )
      ],
    );
  }
}
