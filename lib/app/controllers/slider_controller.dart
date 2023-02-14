import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

class SliderController extends GetxController {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future addData(
      bool activeSlider, String ketSlider, String gambarSlider) async {
    CollectionReference slider = fireStore.collection('slider');
    // Create a new user with a first and last name
    final sliderData = {
      "activeSlider": activeSlider,
      "gambarSlider": gambarSlider,
      "ketSlider": ketSlider,
    };

// Add a new document with a generated ID
    try {
      await slider.add(sliderData).then(
            (DocumentReference doc) => Get.defaultDialog(
              title: "Success!",
              middleText: 'Berhasil menambah data',
              backgroundColor: Color(0xff198754),
              titleStyle: TextStyle(color: Colors.white),
              middleTextStyle: TextStyle(color: Colors.white),
            ),
          );
      Get.offAllNamed(Routes.SLIDER_DATA);
    } catch (e) {
      Get.defaultDialog(
        title: "Error!",
        middleText: 'gagal menambah data',
        backgroundColor: Colors.red,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
      );
    }
  }

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference slider = fireStore.collection('slider');
    return await slider.get();
  }

  Future<void> updateData(String id, bool activeSlider, String ketSlider,
      String gambarSlider) async {
    DocumentReference slider = fireStore.collection('slider').doc(id);
    try {
      final sliderData = {
        "activeSlider": activeSlider,
        "gambarSlider": gambarSlider,
        "ketSlider": ketSlider,
      };

      await slider.update(sliderData);
      Get.defaultDialog(
          title: 'Berhasil', middleText: "Berhasil Mengupdate data");
      Get.toNamed(Routes.SLIDER_DATA);
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Gagal',
        middleText: "Gagal Mengupdate data",
        backgroundColor: Colors.red,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
      );
    }
  }

  Future deleteData(
    String id,
  ) async {
    DocumentReference slider = fireStore.collection('slider').doc(id);
    try {
      await slider.delete();
      Get.defaultDialog(
          title: 'Berhasil', middleText: "Berhasil menghapus data");
      Get.offAllNamed(Routes.SLIDER_DATA);
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Gagal',
        middleText: "Gagal menghapus data",
        backgroundColor: Colors.red,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
      );
    }
  }
}
