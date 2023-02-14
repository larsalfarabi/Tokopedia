import 'package:get/get.dart';

import '../controllers/o_t_p_verification_controller.dart';

class OTPVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPVerificationController>(
      () => OTPVerificationController(),
    );
  }
}
