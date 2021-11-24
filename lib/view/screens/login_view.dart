import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_language_project/control/controllers/login_controller.dart';

import '../../routs.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: ElevatedButton(
          child: const Text('go to home'),
          onPressed: () {
            Get.offAndToNamed(Routes.home);
          },
        ),
      ),
    );
  }
}
