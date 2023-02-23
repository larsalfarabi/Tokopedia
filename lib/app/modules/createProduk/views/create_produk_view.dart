import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/produk_controller.dart';

import '../controllers/create_produk_controller.dart';

class CreateProdukView extends GetView<CreateProdukController> {
  final controllerProduk = Get.put(ProdukController());
  final controller = Get.put(CreateProdukController());
  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;
    final tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('CreateProdukView'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ElevatedButton(
                onPressed: () => controller.uploadGambar(),
                child: Text('upload Gambar'),
              ),
            ),
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
                    borderSide: const BorderSide(width: 1, color: Colors.white),
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
                controller: controller.nama,
                decoration: InputDecoration(
                  hintText: 'Isi nama produk disini',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(width: 1, color: Colors.white),
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
                controller: controller.harga,
                decoration: InputDecoration(
                  hintText: 'Isi harga produk disini',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(width: 1, color: Colors.white),
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
                controller: controller.diskon,
                decoration: InputDecoration(
                  hintText: 'Isi jumlah diskon disini',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(width: 1, color: Colors.white),
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
                controller: controller.statusToko,
                decoration: InputDecoration(
                  hintText: 'Isi status toko disini',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(width: 1, color: Colors.white),
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
                controller: controller.asalToko,
                decoration: InputDecoration(
                  hintText: 'Isi asal toko disini',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(width: 1, color: Colors.white),
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
                controller: controller.rating,
                decoration: InputDecoration(
                  hintText: 'Isi rating disini',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(width: 1, color: Colors.white),
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
                controller: controller.terjual,
                decoration: InputDecoration(
                  hintText: 'Isi terjual disini',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(width: 1, color: Colors.white),
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
              width: lebar,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: ElevatedButton(
                onPressed: () => controllerProduk.addData(
                  controller.gambar.text,
                  controller.nama.text,
                  int.parse(controller.harga.text),
                  int.parse(controller.diskon.text),
                  controller.statusToko.text,
                  controller.asalToko.text,
                  int.parse(controller.rating.text),
                  int.parse(controller.terjual.text),
                ),
                child: Text('Submit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
