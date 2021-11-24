class UserModel {
  User? user;
  String? token;

  UserModel({required this.user, required this.token});

  Map<String, dynamic> toJson() {
    return {
      'user': user!.toJson(),
      'token': token,
    };
  }

  UserModel.fromJson(Map<String, dynamic> map) {
    user = User.fromJson(map['user']);
    token = map['token'];
  }
}

class User {
  int? id;
  String? name;
  String? email;

  User({required this.id, required this.name, required this.email});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }
}
