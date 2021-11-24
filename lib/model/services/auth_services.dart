import 'dart:convert';

import 'package:http/http.dart' as http;
import '../classes/user_model.dart';

class AuthServices {
  static String url = '';
  static http.Client client = http.Client();

  static register({required name, required email, required password}) async {
    var response = await client.post(
      Uri.parse(url),
      headers: {'': ''},
      body: jsonEncode(
          <String, String>{'name': name, 'email': email, 'password': password}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, String> ss = response.body as Map<String, String>;
      UserModel user = UserModel.fromJson(ss);
      return user;
    }
  }

  static login({required email, required password}) async {
    var response = await client.post(
      Uri.parse(url),
      headers: {'': ''},
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, String> ss = response.body as Map<String, String>;
      UserModel user = UserModel.fromJson(ss);
      return user;
    }
  }
}
