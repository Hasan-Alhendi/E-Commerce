import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAddController extends GetxController {
  final GlobalKey<FormState> addProductFormKey = GlobalKey<FormState>();
  var radioValue = 'Electrical'.obs;
  var imagePicked = File('').obs;
  var selectedDate = DateTime.now().obs;
  late TextEditingController titleController,
      phoneController,
      facebookController,
      mountController,
      priceController;
  String title = '', facebook = '', phone = '';
  int mount = 0, price = 0;
  @override
  void onInit() {
    titleController = TextEditingController();
    phoneController = TextEditingController();
    facebookController = TextEditingController();
    mountController = TextEditingController();
    priceController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    titleController.dispose();
    phoneController.dispose();
    facebookController.dispose();
    mountController.dispose();
    priceController.dispose();
    super.dispose();
  }
}
