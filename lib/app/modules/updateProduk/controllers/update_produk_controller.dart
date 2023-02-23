import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/produk_controller.dart';

class UpdateProdukController extends GetxController {
  //TODO: Implement UpdateProdukController
  final listData = Get.arguments;
  TextEditingController gambar = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController diskon = TextEditingController();
  TextEditingController statusToko = TextEditingController();
  TextEditingController asalToko = TextEditingController();
  TextEditingController rating = TextEditingController();
  TextEditingController terjual = TextEditingController();
  final count = 0.obs;

  uploadGambar() async {
    String data = await ProdukController().addPhoto();
    gambar.text = data;
    print(data);
  }

  @override
  void onInit() {
    super.onInit();
    gambar.text = (listData.data() as Map<String, dynamic>)["gambar"];
    nama.text = (listData.data() as Map<String, dynamic>)["nama"];
    // int.parse(harga.text)= (listData.data() as Map<String, dynamic>)["harga"];
    // int.parse(diskon.text) = (listData.data() as Map<String, dynamic>)["diskonPercent"];
    statusToko.text = (listData.data() as Map<String, dynamic>)["statusToko"];
    asalToko.text = (listData.data() as Map<String, dynamic>)["asalToko"];
    // int.parse(rating.text) = (listData.data() as Map<String, dynamic>)["rating"];
    // int.parse(terjual.text) = (listData.data() as Map<String, dynamic>)["terjual"];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
