//import 'package:flutter/material.dart';
// ignore_for_file: unused_local_variable, use_rethrow_when_possible, avoid_print

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../classes/http_exception.dart';
import 'package:programming_language_project/model/classes/products.dart';
import '../classes/product.dart';

class ProductsServices {
  static Future<String> _loadAsset() async {
    return await rootBundle.loadString('assets/products.json');
  }

  static Future<List<Product>> fetchProducts() async {
    String jsonString = await _loadAsset();
    Map valueMap = jsonDecode(jsonString);

    List<dynamic> extractedData = valueMap["products"];
    //print(extractedData);
    //print('----------------------------------');
    final List<Product> loadedProducts = [];
    for (var item in extractedData) {
      loadedProducts.add(Product.fromJson(item));
    }
    // print(loadedProducts[1].commInfo);
    /* extractedData!.forEach((productId, productData) {
        loadedProducts.add(Product(
          id: productId,
          title: productData['title'],
          imageUrl: productData['imageUrl'],
          expireDate: productData['expireDate'],
          type: productData['type'],
          commInfo: productData['commInfo'],
          mount: productData['mount'],
          price: productData['price'],
          isLike:
              favoriteData == null ? false : favoriteData[productId] ?? false,
        ));
      }); */
    Products.set_items(loadedProducts);
    // Product.setIsFavourite(loadedProducts[0].isFavorate!);
    print(loadedProducts[0].commInfo);
    return loadedProducts;
  }
}
/* static Future<List<Product>> fetchProducts(
      [bool filterByUser = false]) async {
    final filterString = filterByUser ? '' : '';
    var url = '';
    try {
      final response = await http.get(Uri.parse(url));
      final Map<String, dynamic>? extractedData =
          json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        //return ;
      }
      url = '';
      final favoriteResponse = await http.get(Uri.parse(url));
      final favoriteData = json.decode(favoriteResponse.body);
      final List<Product> loadedProducts = [];
      extractedData!.forEach((productId, productData) {
        loadedProducts.add(Product(
          id: productId,
          title: productData['title'],
          imageUrl: productData['imageUrl'],
          expireDate: productData['expireDate'],
          type: productData['type'],
          commInfo: productData['commInfo'],
          mount: productData['mount'],
          price: productData['price'],
          isLike:
              favoriteData == null ? false : favoriteData[productId] ?? false,
        ));
      });
      Products.set_items(loadedProducts);
      return loadedProducts;
    } catch (error) {
      throw (error);
    }
  }*/

Future<void> addProduct(Product product) async {
  const url = '';
  try {
    final response = await http.post(
      Uri.parse(url),
      body: json.encode(
        {
          'title': product.title,
          'imageUrl': product.imageUrl,
          'expireDate': product.expireDate,
          'type': product.type,
          'commInfo': product.commInfo,
          'mount': product.mount,
          'price': product.price,
          'creatorId': Products.userId,
        },
      ),
    );

    final newProduct = Product(
      id: json.decode(response.body)['name'],
      title: product.title,
      price: product.price,
      imageUrl: product.imageUrl,
      commInfo: product.commInfo,
      faceAccount: product.faceAccount,
      expireDate: product.expireDate,
      mount: product.mount,
      type: product.type,
      creatorId: product.creatorId,
      countView: product.countView,
    );

    Products.set_item(0, newProduct);
  } catch (error) {
    throw error;
  }
}

Future<void> updateproduct(String id, Product newProduct) async {
  final prodIndex = Products.items.indexWhere((prod) => prod.id == id);
  if (prodIndex >= 0) {
    const url = '';
    try {
      await http.patch(Uri.parse(url),
          body: json.encode({
            'title': newProduct.title,
            'imageUrl': newProduct.imageUrl,
            'expireDate': newProduct.expireDate,
            'type': newProduct.type,
            'commInfo': newProduct.commInfo,
            'mount': newProduct.mount,
            'price': newProduct.price,
          }));
      Products.items[prodIndex] = newProduct;
    } catch (error) {
      throw error;
    }
  }
}

Future<void> deleteProduct(String id) async {
  const url = '';
  final existingProductIndex =
      Products.items.indexWhere((prod) => prod.id == id);
  Product? existingProduct = Products.items[existingProductIndex];
  //--------------------------------------------
  Products.items.removeAt(existingProductIndex);
  //--------------------------------------------
  final response = await http.delete(Uri.parse(url));
  if (response.statusCode >= 400) {
    Products.set_item(existingProductIndex, existingProduct);
    throw HttpException('Could not delete product.');
  }
  existingProduct = null;
}
