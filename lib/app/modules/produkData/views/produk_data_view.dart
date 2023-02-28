import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tokopedia/app/controllers/produk_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/produk_data_controller.dart';

class ProdukDataView extends GetView<ProdukDataController> {
  final controllerProduk = Get.put(ProdukController());
  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;
    final tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<QuerySnapshot<Object?>>(
          future: controllerProduk.getData(),
          builder: (context, Snapshot) {
            if (Snapshot.connectionState == ConnectionState.done) {
              var listData = Snapshot.data!.docs;
              print("========================");
              print(listData);
              print("========================");
              return SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                      listData.length,
                      (index) => produk(lebar, lebar * 0.42, tinggi,
                          listData[index], controllerProduk)),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.offAllNamed(Routes.CREATE_PRODUK),
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget produk(lebar, lebar2, tinggi, data, controller) {
  final rumus = (data.data() as Map<String, dynamic>)['diskonPercent'] *
      ((data.data() as Map<String, dynamic>)['harga'] / 100);
  final hargaFix = (data.data() as Map<String, dynamic>)['harga'] - rumus;
  return InkWell(
    onTap: () => Get.toNamed(Routes.DETAIL, arguments: data),
    child: Container(
      height: tinggi * 0.44,
      width: lebar2,
      margin: EdgeInsets.fromLTRB(12, 15, 11, 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: shadow,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            width: lebar,
            height: tinggi * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                      (data.data() as Map<String, dynamic>)["gambar"],
                    ),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: lebar,
            height: tinggi * 0.223,
            padding: EdgeInsets.only(top: 10, right: 8, left: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: lebar,
                  child: Text(
                    "${(data.data() as Map<String, dynamic>)['nama']}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: tinggi * 0.006,
                ),
                Text(
                  "Rp${hargaFix}00 ",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                SizedBox(
                  height: tinggi * 0.006,
                ),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 20,
                      margin: EdgeInsets.only(right: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: bgDiskon,
                      ),
                      child: Text(
                        "${(data.data() as Map<String, dynamic>)['diskonPercent'].toString()}%",
                        style: TextStyle(
                            color: diskon,
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                    ),
                    Text(
                      "Rp${(data.data() as Map<String, dynamic>)['harga'].toString()}.000",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                          color: search),
                    )
                  ],
                ),
                SizedBox(
                  height: tinggi * 0.006,
                ),
                Row(
                  children: [
                    Image.network(
                      (data.data() as Map<String, dynamic>)['statusToko'],
                      width: 15,
                    ),
                    Text(
                      (data.data() as Map<String, dynamic>)['asalToko'],
                      style: TextStyle(
                        color: search,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: tinggi * 0.011,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 3),
                      child: Icon(
                        IconlyBold.star,
                        color: star,
                        size: 14,
                      ),
                    ),
                    Text(
                      "${(data.data() as Map<String, dynamic>)['rating'].toString()} | Terjual ${(data.data() as Map<String, dynamic>)['terjual'].toString()}",
                      style: TextStyle(color: search, fontSize: 13),
                    )
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => controller.deleteData(data.id),
                      child: Container(
                        margin: EdgeInsets.only(right: 10, top: 4),
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.black12),
                        child: Icon(
                          IconlyBroken.delete,
                          color: Colors.red,
                          size: 18,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.offAllNamed(Routes.UPDATE_PRODUK,
                          arguments: data),
                      child: Container(
                        margin: EdgeInsets.only(top: 4),
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.black12),
                        child: Icon(
                          IconlyBroken.edit,
                          color: Colors.blue,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
