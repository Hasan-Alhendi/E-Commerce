import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:programming_language_project/control/controllers/product_add_controller.dart';
//import 'package:medicalreport/constant/Constants.dart';

class UserImagePicker extends GetView<ProductAddController> {
  final ImagePicker _picker = ImagePicker();

  UserImagePicker({Key? key}) : super(key: key);

  void _pickedImageFile(ImageSource src) async {
    final pickedImageFile = await _picker.pickImage(source: src);

    if (pickedImageFile != null) {
      controller.imagePicked.value = File(pickedImageFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Column(
            children: [
              Obx(
                () => CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 40,
                  backgroundImage: controller.imagePicked.value != null
                      ? FileImage(controller.imagePicked.value)
                      : null,
                ),
              ),
              /*  Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
                // child: ,
              ) */
            ],
          ),
          onTap: () {
            showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("الرجاء اختيار الصورة"),
                  content: SizedBox(
                    height: 150,
                    child: Column(
                      children: [
                        const Divider(
                          color: Colors.black,
                        ),
                        Container(
                          color: Colors.teal,
                          child: ListTile(
                            leading: const Icon(Icons.image),
                            title: const Text("المعرض"),
                            onTap: () {
                              _pickedImageFile(ImageSource.gallery);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.teal,
                          child: ListTile(
                            leading: const Icon(Icons.image),
                            title: const Text("الكاميرا"),
                            onTap: () {
                              _pickedImageFile(ImageSource.camera);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:medicalreport/constant/Constants.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({Key? key}) : super(key: key);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _imagePicked;
  final ImagePicker _picker = ImagePicker();

  void _pickedImageFile(ImageSource src) async {
    final pickedImageFile = await _picker.pickImage(source: src);

    if (pickedImageFile != null) {
      setState(() {
        _imagePicked = File(pickedImageFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 40,
                backgroundImage:
                    _imagePicked != null ? FileImage(_imagePicked!) : null,
              ),
              /*  Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
                // child: ,
              ) */
            ],
          ),
          onTap: () {
            showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("الرجاء اختيار الصورة"),
                  content: SizedBox(
                    height: 150,
                    child: Column(
                      children: [
                        const Divider(
                          color: Colors.black,
                        ),
                        Container(
                          color: Colors.teal,
                          child: ListTile(
                            leading: const Icon(Icons.image),
                            title: const Text("المعرض"),
                            onTap: () {
                              _pickedImageFile(ImageSource.gallery);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.teal,
                          child: ListTile(
                            leading: const Icon(Icons.image),
                            title: const Text("الكاميرا"),
                            onTap: () {
                              _pickedImageFile(ImageSource.camera);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
*/