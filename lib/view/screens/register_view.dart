import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_language_project/routs.dart';
//import '/view/screens/login_view.dart';
//import '../../routs.dart';
import '../../control/controllers/register_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: ElevatedButton(
          child: const Text('go to login'),
          onPressed: () {
            Get.offAndToNamed(Routes.login);
          },
        ),
      ),
    );
  }
}
