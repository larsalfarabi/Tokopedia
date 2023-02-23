import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';

class CreateProdukController extends GetxController {
  TextEditingController gambar = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController diskon = TextEditingController();
  TextEditingController statusToko = TextEditingController();
  TextEditingController asalToko = TextEditingController();
  TextEditingController rating = TextEditingController();
  TextEditingController terjual = TextEditingController();

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
