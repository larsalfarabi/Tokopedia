import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';

class CreateSliderController extends GetxController {
  //TODO: Implement CreateSliderController
  RxBool aktif = true.obs;
  change() => aktif.toggle();
  TextEditingController gambar = TextEditingController();
  TextEditingController keterangan = TextEditingController();

  uploadGambar() async {
    String data = await SliderController().addPhoto();
    gambar.text = data;
    print(data);
  }

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
