// ignore_for_file: avoid_print

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

  //bool isLike;

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
    required this.countView,
    //this.isLike = false,
  });

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
      //'isLike': isLike,
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
    //isLike: json['isLike'];
  }

  // String toJson() => json.encode(toMap());

  //factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}
