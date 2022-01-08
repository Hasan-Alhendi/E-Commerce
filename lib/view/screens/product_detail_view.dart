import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:programming_language_project/model/classes/product.dart';
import 'package:programming_language_project/model/classes/products.dart';

class ProductDetailView extends StatelessWidget {
  ProductDetailView({Key? key}) : super(key: key);

  final Product loadedProduct = Products.findById(Get.arguments as String);
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    //  print(Get.arguments);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 400,
            //pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(loadedProduct.title!),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    loadedProduct.title!,
                    style: const TextStyle(
                      //color: Colors.grey,
                      fontSize: 26,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${loadedProduct.price} S.P',
                    style: const TextStyle(
                      //color: Colors.grey,
                      fontSize: 20,
                    ),
                    //textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.phone,
                    size: 30,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${loadedProduct.commInfo}',
                    style: const TextStyle(
                      //color: Colors.grey,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.facebook,
                    size: 30,
                    color: Colors.lightBlue[400],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${loadedProduct.faceAccount}',
                    style: const TextStyle(
                      //color: Colors.grey,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.date_range_outlined,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    formatter.format(loadedProduct.expireDate!),
                    style: const TextStyle(
                      //color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '   Number of pieces left: ${loadedProduct.mount}',
                style: const TextStyle(
                  // color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
