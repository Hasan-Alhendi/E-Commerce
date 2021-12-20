import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              /* GestureDetector(
                child: CircleAvatar(
                  radius: 50,
                  child: Image.network(
                      'https://freepngimg.com/thumb/shoes/28530-3-nike-shoes-transparent-thumb.png'),
                ),
              ), */
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
                // controller: controller.emailController,
                //  onSaved: (value) => controller.email = value!,
                //  validator: (emailInput) =>
                //    controller.validateEmail(emailInput!),
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
                //  validator: (emailInput) =>
                //    controller.validateEmail(emailInput!),
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
                //  validator: (emailInput) =>
                //    controller.validateEmail(emailInput!),
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
                //  validator: (emailInput) =>
                //    controller.validateEmail(emailInput!),
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
                    radioMethod('Electrical'),
                    radioMethod('Mechanized'),
                    radioMethod('personal')
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
    // String _radioValue = 'Electrical';
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
}
