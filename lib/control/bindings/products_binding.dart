import 'package:get/get.dart';
import '../controllers/product_search_controller.dart';
import '../controllers/product_add_controller.dart';
import '../controllers/product_edit_controller.dart';
import '../controllers/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController(), fenix: true);
    Get.lazyPut(() => ProductEditController(), fenix: true);
    Get.lazyPut(() => ProductAddController(), fenix: true);
    Get.lazyPut(() => ProductSearchController(), fenix: true);
  }
}
