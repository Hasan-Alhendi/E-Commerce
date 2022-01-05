// ignore_for_file: avoid_print

import 'package:get/get.dart';

class Product {
  String? id;
  String? creatorId;
  String? title;
  String? imageUrl;
  DateTime? expireDate;
  String? type;
  String? commInfo;
  int? mount;
  int? price;
  int? countView;

  bool? isFavorate;

  Product({
    required this.id,
    required this.creatorId,
    required this.title,
    required this.imageUrl,
    required this.expireDate,
    required this.type,
    required this.commInfo,
    required this.mount,
    required this.price,
    this.countView = 0,
    this.isFavorate = false,
  }) {
    //this.setQuantity(quantity);
    //this.setIsFavourite(isFavorate!);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creatorId': creatorId,
      'title': title,
      'imageUrl': imageUrl,
      'expireDate': expireDate!.millisecondsSinceEpoch,
      'type': type,
      'commInfo': commInfo,
      'mount': mount,
      'price': price,
      'countView': countView,
      'isFavorate': isFavorate,
    };
  }

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creatorId = json['creatorId'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    expireDate = DateTime.parse(json['expireDate']);
    type = json['type'];
    commInfo = json['commInfo'];
    mount = json['mount'];
    price = json['price'];
    countView = json['countView'];
    //print('id is: $id - price is: $price');
    isFavorate = json['isFavorate'];
  }

  RxBool isFavourite = false.obs;

  setIsFavourite(bool value) => isFavourite.value = value;

  RxInt cnt = 0.obs;

  setcnt(int value) => cnt.value = value;
}
