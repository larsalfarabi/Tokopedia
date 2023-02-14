import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetpasswordController extends GetxController {
  //TODO: Implement ResetpasswordController
  TextEditingController email = TextEditingController();
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
