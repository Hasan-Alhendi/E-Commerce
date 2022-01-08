import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/classes/serve.dart';
import 'model/classes/themmode.dart';
import 'routs.dart';
import 'view/screens/page_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // await translator.init(
  // localeType: LocalizationDefaultType.device,
  // languagesList: <String>['en', 'ar'],
  //assetsDirectory: 'assets/langs/',
  //);

  SharedPreferences pref = await SharedPreferences.getInstance();
  bool? decision = pref.getBool('x');
  Widget _screen =
      (decision == false || decision == null) ? const MyPage() : const MyApp();

  runApp(_screen);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      localizationsDelegates: translator.delegates,
      //locale: translator.locale,
      //supportedLocales: translator.locals(),
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      initialRoute: Routes.splash,
      getPages: Routes.routes,
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //theme: Themes.light,
      //darkTheme: Themes.dark,
      //themeMode: ThemeServices().theme,
      // localizationsDelegates: translator.delegates,
      //locale: translator.locale,
      //supportedLocales: translator.locals(),
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      initialRoute: Routes.pageView,
      getPages: Routes.routes,
    );
  }
}
 
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomBar(),
    );
  }
}
*/