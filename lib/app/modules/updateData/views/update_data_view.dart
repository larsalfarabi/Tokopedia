import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';

import '../controllers/update_data_controller.dart';

class UpdateDataView extends GetView<UpdateDataController> {
  final listData = Get.arguments;
  final controller = Get.put(UpdateDataController());
  final controllerSlider = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;
    final tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('UpdateDataView'),
          elevation: 0,
          centerTitle: true,
        ),
        body: Obx(
          () => Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: TextField(
                  cursorColor: Colors.white,
                  controller: controller.gambar,
                  decoration: InputDecoration(
                    hintText: 'Isi gambar disini',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: Colors.white),
                      // gapPadding: 10,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: TextField(
                  cursorColor: Colors.white,
                  controller: controller.keterangan,
                  decoration: InputDecoration(
                    hintText: 'Isi ketarangan disini',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: Colors.white),
                      // gapPadding: 10,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Switch(
                      value: controller.aktif.value,
                      onChanged: (value) => controller.change(),
                    ),
                    Text(controller.aktif.value ? 'Aktif' : 'Tidak Aktif'),
                  ],
                ),
              ),
              Container(
                width: lebar,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: ElevatedButton(
                  onPressed: () => controllerSlider.updateData(
                      listData.id,
                      controller.aktif.value,
                      controller.keterangan.text,
                      controller.gambar.text),
                  child: Text('Submit'),
                ),
              )
            ],
          ),
        ));
  }
}
