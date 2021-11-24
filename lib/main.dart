import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      initialRoute: Routes.register,
      getPages: Routes.routes,
    );
  }
}
