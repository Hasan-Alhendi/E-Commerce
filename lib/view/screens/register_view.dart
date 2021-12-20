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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0, //brightness
        // brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          height: MediaQuery.of(context).size.height - 100,
          width: double.infinity,
          child: Form(
            key: controller.registerFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                      width: 0,
                    ),
                    Text(
                      "Create an account , It's Free ",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: controller.nameController,
                      keyboardType: TextInputType.name,
                      onSaved: (value) => controller.name = value!,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        // prefixIcon: Icon(Icons.),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.emailController,
                      validator: (emailInput) =>
                          controller.validateEmail(emailInput!),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) => controller.email = value!,
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.passowrdController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (passwordInput) =>
                          controller.validatePassword(passwordInput!),
                      obscureText: true,
                      onSaved: (value) => controller.password = value!,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => controller.isLoding.value == true
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const Text('')),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.blue,
                      child: MaterialButton(
                        onPressed: () {
                          controller.doRegister();
                          //   Get.offAndToNamed(Routes.home);
                        },
                        child: const Text(
                          " Sign up",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("I already have an account"),
                    TextButton(
                      onPressed: () {
                        Get.offAndToNamed(Routes.login);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
