// ignore_for_file: non_constant_identifier_names, prefer_final_fields, avoid_print

import 'product.dart';

class Products {
  static List<Product> _items = [];
  static List<Product> _itemsPro = [];
  static String authToken = '';
  static String userId = '';

  //Products({required this.authToken, required this.userId});
  String get uId {
    return userId;
  }

  /* static String get token {
    return authToken;
  } */

  static List<Product> get items {
    return [..._items];
  }

  static List<Product> get itemsPro {
    return [..._itemsPro];
  }

  static set_item(int index, Product product) {
    _items.insert(index, product);
  }

  static set_items(List<Product> products) {
    _items.insertAll(0, products);
  }

  static set_itemspro(List<Product> products) {
    _itemsPro.insertAll(0, products);
  }

  /* static List<Product> get likedItems {
    return _items.where((prodItem) => prodItem.isLike).toList();
  } */

  static List<Product> itemsByUser(String id) {
    return _items.where((prodItem) => prodItem.creatorId == id).toList();
  }

  static Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
