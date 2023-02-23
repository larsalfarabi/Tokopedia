import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

class ProdukController extends GetxController {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  String url = '';
  File? path;

  addData(String gambar, String nama, int harga, int diskonPercent,
      String statusToko, String asalToko, int rating, int terjual) async {
    CollectionReference produk = fireStore.collection('produk');

    final produkData = {
      'gambar': gambar,
      'nama': nama,
      'harga': harga,
      'diskonPercent': diskonPercent,
      'statusToko': statusToko,
      'asalToko': asalToko,
      'rating': rating,
      'terjual': terjual,
    };
    try {
      await produk.add(produkData).then(
            (DocumentReference doc) => Get.defaultDialog(
              title: "Success!",
              middleText: 'Berhasil menambah data',
              backgroundColor: Color(0xff198754),
              titleStyle: TextStyle(color: Colors.white),
              middleTextStyle: TextStyle(color: Colors.white),
            ),
          );
      Get.offAllNamed(Routes.PRODUK_DATA);
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
    CollectionReference produk = fireStore.collection('produk');
    return await produk.get();
  }

  updateData(
      String id,
      String gambar,
      String nama,
      int harga,
      int diskonPercent,
      String statusToko,
      String asalToko,
      int rating,
      int terjual) async {
    DocumentReference produk = fireStore.collection('produk').doc(id);
    try {
      final produkData = {
        'gambar': gambar,
        'nama': nama,
        'harga': harga,
        'diskonPercent': diskonPercent,
        'statusToko': statusToko,
        'asalToko': asalToko,
        'rating': rating,
        'terjual': terjual,
      };

      await produk.update(produkData);
      Get.defaultDialog(
          title: 'Berhasil', middleText: "Berhasil Mengupdate data");
      Get.toNamed(Routes.PRODUK_DATA);
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

  deleteData(
    String id,
  ) async {
    DocumentReference produk = fireStore.collection('produk').doc(id);
    try {
      await produk.delete();
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda ingin menhapus",
        confirm: ElevatedButton(
          onPressed: () => Get.offAllNamed(Routes.PRODUK_DATA),
          child: Text('YES'),
        ),
        cancel: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () => Get.back(),
          child: Text('NO'),
        ),
      );
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

  addPhoto() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      String namaFile = result.files.first.name;
      url = namaFile;
      path = file;
      try {
        await storage.ref("${namaFile}").putFile(file);
        final data = await storage.ref("${namaFile}").getDownloadURL();

        url = data;
        return url;
      } catch (e) {
        print(e);
        Get.defaultDialog(
          title: 'Gagal',
          middleText: "Gagal mengupload gambar/file",
          backgroundColor: Colors.red,
          titleStyle: TextStyle(color: Colors.white),
          middleTextStyle: TextStyle(color: Colors.white),
        );
      }
    } else {
      print('gagal mengirim file');
    }
  }
}
