import 'package:get/get.dart';

import '../controllers/checkemail_controller.dart';

class CheckemailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckemailController>(
      () => CheckemailController(),
    );
  }
}
