import 'package:get/get.dart';
import 'control/bindings/bottom_bar_binding.dart';
import 'control/bindings/products_binding.dart';
import 'view/screens/page_view.dart';
import 'view/screens/product_detail_view.dart';
import 'view/screens/products_view.dart';
import 'control/bindings/login_binding.dart';
import 'control/bindings/register_binding.dart';

import 'view/screens/login_view.dart';
import 'view/screens/register_view.dart';
import 'view/screens/splash_view.dart';
import 'view/widgets/bottom_bar.dart';

class Routes {
  static const register = '/register';
  static const login = '/login';
  static const products = '/products';
  static const bottombar = '/bottombar';
  static const productDetail = '/detail';
  static const splash = '/splash';
  static const pageView = '/pageView';

  static final routes = [
    GetPage(
        name: register,
        page: () => const RegisterScreen(),
        binding: RegisterBinding()),
    GetPage(
        name: login, page: () => const LoginView(), binding: LoginBinding()),
    GetPage(
        name: products,
        page: () => const ProductsView(),
        binding: ProductsBinding()),
    GetPage(name: productDetail, page: () => ProductDetailView()),
    GetPage(
        name: bottombar,
        page: () => const BottomBar(),
        binding: BottomBarBinding()),
    GetPage(
      name: splash,
      page: () => SplashScreenView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: pageView,
      page: () => PageViewScreen(),
      binding: LoginBinding(),
    ),
  ];
}
