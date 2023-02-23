import 'package:get/get.dart';

import '../controllers/update_produk_controller.dart';

class UpdateProdukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateProdukController>(
      () => UpdateProdukController(),
    );
  }
}
