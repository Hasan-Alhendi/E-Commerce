import 'package:get/get.dart';
import 'view/screens/home_view.dart';
import 'control/bindings/login_binding.dart';
import 'control/bindings/register_binding.dart';

import 'view/screens/login_view.dart';
import 'view/screens/register_view.dart';

class Routes {
  static const register = '/register';
  static const login = '/login';
  static const home = '/home';

  static final routes = [
    GetPage(
        name: register,
        page: () => const RegisterScreen(),
        binding: RegisterBinding()),
    GetPage(
        name: login, page: () => const LoginView(), binding: LoginBinding()),
    GetPage(name: home, page: () => const HomeView()),
  ];
}

/* class R {
  static const register = '/register';
  static const login = '/login';
  static const home = '/home';
} */
