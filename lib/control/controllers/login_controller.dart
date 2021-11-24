import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../model/services/auth_services.dart';
import '../../routs.dart';

class LoginController extends GetxController {
  var isLoding = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController nameController,
      emailController,
      passowrdController;
  String email = '', password = '';
  final storage = const FlutterSecureStorage();
  @override
  void onInit() {
    emailController = TextEditingController();
    passowrdController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passowrdController.dispose();
    super.dispose();
  }

  String? validateEmail(String emailInput) {
    if (!GetUtils.isEmail(emailInput)) {
      return "This is worng email";
    } else {
      return null;
    }
  }

  String? validatePassword(String passwordInput) {
    if (passwordInput.length < 5) {
      return "This is week password";
    } else {
      return null;
    }
  }

  doRegister() async {
    bool isValidate = loginFormKey.currentState!.validate();
    if (isValidate) {
      isLoding.value = true; //  isLoding(true);
      try {
        var data = await AuthServices.login(
            email: emailController.text, password: passowrdController.text);

        if (data != null) {
          await storage.write(key: 'name', value: data.user.name);
          await storage.write(key: 'token', value: data.token);

          loginFormKey.currentState!.save();

          Get.toNamed(Routes.home);
        } else {
          Get.snackbar('regiser', 'this is problem');
        }
      } finally {
        isLoding(false);
      }
    }
  }
}
