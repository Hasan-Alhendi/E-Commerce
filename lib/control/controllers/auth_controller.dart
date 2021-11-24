import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
//import 'package:flutter/material.dart';

class AuthController extends GetxController {
  final storage = const FlutterSecureStorage();
  var name = ''.obs;
  var token = '';
  @override
  void onInit() {
    authData();
    super.onInit();
  }

  authData() async {
    name.value = (await storage.read(key: 'name'))!;
    token = (await storage.read(key: 'token'))!;
  }

  bool isAuth() {
    return token.isNotEmpty;
  }

  doLogout() async {
    await storage.deleteAll();
  }
}
