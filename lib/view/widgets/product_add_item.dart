import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../control/controllers/product_add_controller.dart';

import 'imagepicker.dart';

class ProductAddItem extends GetView<ProductAddController> {
  const ProductAddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      height: MediaQuery.of(context).size.height - 100,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Form(
          key: controller.addProductFormKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Product Info',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
                width: 0,
              ),
              UserImagePicker(),
              const SizedBox(
                height: 25,
                width: 0,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.text,
                controller: controller.titleController,
                onSaved: (value) => controller.title = value!,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.datetime,
                controller: controller.selectedDateController,
                // onSaved: (value) => controller.selectedDate = value!,
                onTap: () {
                  _selectDate(context);
                },
                decoration: const InputDecoration(
                  labelText: 'Expire Date',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.phone,
                controller: controller.phoneController,
                onSaved: (value) => controller.phone = value!,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.url,
                controller: controller.facebookController,
                onSaved: (value) => controller.facebook = value!,
                decoration: const InputDecoration(
                  labelText: 'Facebook',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                controller: controller.mountController,
                onSaved: (value) => controller.mount = int.parse(value!),
                decoration: const InputDecoration(
                  labelText: 'Mount',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                controller: controller.priceController,
                onSaved: (value) => controller.price = int.parse(value!),
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 20.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    radioMethod('Foods'),
                    radioMethod('Drinks'),
                    radioMethod('Medicines')
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(child: Text('submit')),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
  /* void _datePicker(){
    showDatePicker(context: context, initialDate: initialDate, firstDate: firstDate, lastDate: lastDate)
  } */

  Row radioMethod(String value) {
    return Row(
      children: [
        Obx(
          () => Radio(
              value: value,
              groupValue: controller.radioValue.value,
              onChanged: (value) {
                controller.radioValue.value = value as String;
              }),
        ),
        Text(value),
      ],
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      // ignore: prefer_if_null_operators, unnecessary_null_comparison
      initialDate: controller.selectedDate != null
          ? controller.selectedDate
          : DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      controller.selectedDate = newSelectedDate;
      controller.selectedDateController
        ..text = DateFormat.yMMMd().format(controller.selectedDate)
        ..selection = TextSelection.fromPosition(
          TextPosition(
              offset: controller.selectedDateController.text.length,
              affinity: TextAffinity.upstream),
        );
    }
  }
}
