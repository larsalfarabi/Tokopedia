import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  RxBool showEyes = true.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  changeEye() => showEyes.toggle();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
