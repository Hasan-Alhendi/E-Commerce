import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_language_project/model/classes/product.dart';
import 'package:programming_language_project/model/classes/products.dart';

class ProductDetailView extends StatelessWidget {
  ProductDetailView({Key? key}) : super(key: key);

  final Product loadedProduct = Products.findById(Get.arguments as String);
  @override
  Widget build(BuildContext context) {
    //  print(Get.arguments);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(loadedProduct.title!),
              background: Hero(
                tag: loadedProduct.id!,
                child: Image.network(
                  loadedProduct.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 10),
              Text(
                '\$${loadedProduct.price}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '${loadedProduct.expireDate}',
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
              const SizedBox(
                height: 800,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
