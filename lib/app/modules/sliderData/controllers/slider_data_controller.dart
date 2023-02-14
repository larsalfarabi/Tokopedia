import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';

class SliderDataController extends GetxController {
  var data;
  final count = 0.obs;
  RxBool aktif = true.obs;
  @override
  void onInit() {
    print('slider');
    SliderController().getData();
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
