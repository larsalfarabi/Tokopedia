import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/app/controllers/produk_controller.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final controllerAuth = Get.put(AuthControllerController());
  final controllerSlider = Get.put(SliderController());
  final controllerProduk = Get.put(ProdukController());
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<HomeController>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: tinggi * 0.13,
                decoration: BoxDecoration(color: bgNav),
                padding: EdgeInsets.fromLTRB(13, 35, 13, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: lebar * 0.45,
                      // height: 40,
                      child: TextField(
                        cursorColor: search,
                        style: TextStyle(color: search),
                        decoration: InputDecoration(
                          hintText: "Cari Nvidia RTX 4090™",
                          filled: true,
                          hintStyle: TextStyle(color: search),
                          prefixIcon: Icon(
                            IconlyLight.search,
                            size: 18,
                            color: search,
                          ),
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(vertical: 1),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 1),
                            borderRadius: BorderRadius.circular(6),
                            // gapPadding: 5,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 1),
                            // gapPadding: 5,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: lebar * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            IconlyLight.message,
                            color: Colors.white,
                          ),
                          Icon(
                            IconlyLight.notification,
                            color: Colors.white,
                          ),
                          Icon(
                            IconlyLight.buy,
                            color: Colors.white,
                          ),
                          InkWell(
                            onTap: controllerAuth.logout,
                            child: Icon(
                              IconlyLight.logout,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.015,
              ),
              FutureBuilder(
                  future: controllerSlider.getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var listData = snapshot.data!.docs;
                      return Container(
                        width: lebar,
                        height: tinggi * 0.15,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: tinggi * 0.4,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                          ),
                          items: listData.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: lebar,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Image.network((i.data()
                                      as Map<String, dynamic>)['gambarSlider']),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Wrap(
                  spacing: 6,
                  alignment: WrapAlignment.center,
                  runSpacing: 20,
                  children: [
                    Menu('assets/menu/promo.png', 'Promo Hari Ini', tinggi),
                    Menu('assets/menu/toserba.png', 'Toserba', tinggi),
                    Menu('assets/menu/elktronik.png', 'Elektonik', tinggi),
                    Menu('assets/menu/topup.png', 'Top-Up & Tagihan', tinggi),
                    Menu('assets/menu/lihat.png', 'Lihat Semua', tinggi),
                    Menu('assets/menu/official.png', 'Official Store', tinggi),
                    Menu('assets/menu/live.png', 'Live Shopping', tinggi),
                    Menu('assets/menu/seru.png', 'Tokopedia Seru', tinggi),
                    Menu('assets/menu/COD.png', 'Bayar Di Tempat', tinggi),
                    Menu('assets/menu/bangga.png', 'Bangga Lokal', tinggi),
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.030,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Kejar Diskon Spesial',
                  style: TextStyle(
                    color: judul1,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: tinggi * 0.012,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Berakhir dalam',
                          style: TextStyle(color: search, fontSize: 13),
                        ),
                        Container(
                          width: lebar * 0.3,
                          height: 25,
                          margin: EdgeInsets.only(left: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: bgTimer,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                IconlyLight.time_circle,
                                color: Colors.white,
                                size: 16,
                              ),
                              Text(
                                '00  :  15  :  12',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.5,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Lihat Semua',
                      style:
                          TextStyle(color: bgNav, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                width: lebar,
                height: tinggi * 0.47,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [bgHome, bgHome2]),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Image.asset(
                          'assets/kebut.png',
                        ),
                      ),
                      FutureBuilder(
                          future: controllerProduk.getDataDiskon(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              var listData = snapshot.data!.docs;
                              print("========================");
                              print(listData);
                              print("========================");
                              return Row(
                                children: List.generate(
                                    listData.length,
                                    (index) => produk(
                                          lebar,
                                          lebar * 0.42,
                                          tinggi,
                                          listData[index],
                                        )),
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          })
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: tinggi * 0.025,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pilihan Promo Hari Ini',
                      style: TextStyle(
                        color: judul1,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Lihat Semua',
                      style:
                          TextStyle(color: bgNav, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.015,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: tinggi * 0.35,
                        width: 130,
                        margin: EdgeInsets.only(right: 12),
                        child: Image.asset('assets/flash sale.png',
                            fit: BoxFit.fill),
                      ),
                      Container(
                        height: tinggi * 0.35,
                        width: 130,
                        margin: EdgeInsets.only(right: 12),
                        child:
                            Image.asset('assets/diskon.png', fit: BoxFit.fill),
                      ),
                      Container(
                        height: tinggi * 0.35,
                        width: 130,
                        child:
                            Image.asset('assets/diskon.png', fit: BoxFit.fill),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: tinggi * 0.025,
              ),
              Container(
                width: lebar,
                child: Divider(
                  color: lineGray,
                  height: 1,
                  thickness: 1,
                  indent: 1,
                ),
              ),
              SizedBox(
                height: tinggi * 0.025,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Produk Pilihan Untukmu',
                      style: TextStyle(
                        color: judul1,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Lihat Semua',
                      style:
                          TextStyle(color: bgNav, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.01,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: tinggi * 0.47,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: FutureBuilder(
                        future: controllerProduk.getData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            var listData = snapshot.data!.docs;
                            print("========================");
                            print(listData);
                            print("========================");
                            return Row(
                              children: List.generate(
                                  listData.length,
                                  (index) => produk(lebar, lebar * 0.42, tinggi,
                                      listData[index])),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        })),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                width: lebar,
                height: 8,
                color: kotak2,
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      pilihan(
                          lebar, pilihan1, pilihan2, 'For rizqi', Colors.white),
                      pilihan(lebar, pilihan3, pilihan4, 'Special Discount',
                          Colors.transparent),
                      pilihan(lebar, pilihan5, pilihan6, 'Aktivitasmu',
                          Colors.transparent),
                      pilihan(lebar, pilihan7, pilihan8, 'Kesukaanmu',
                          Colors.transparent),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
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
                              (index) => produk(
                                  lebar, lebar * 0.4, tinggi, listData[index])),
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
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                width: lebar,
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(width: 1, color: kotak2)),
                child: Text(
                  'Lihat Selebihnya',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500, color: judul1),
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Menu(image, String text, tinggi) {
  return Container(
    width: 65,
    child: Column(
      children: [
        Image.asset(
          image,
          width: 25,
        ),
        SizedBox(
          height: tinggi * 0.01,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
      ],
    ),
  );
}

Widget pilihan(lebar, warna, warna2, judul, warna3) {
  return Container(
    width: lebar * 0.3,
    height: 66,
    padding: EdgeInsets.all(12),
    margin: EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topRight,
        colors: [warna, warna2],
      ),
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: 25,
        height: 3,
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2), color: warna3),
      ),
      Text(
        judul,
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
      )
    ]),
  );
}

Widget produk(lebar, double lebar2, tinggi, data) {
  final rumus = (data.data() as Map<String, dynamic>)['diskonPercent'] *
      ((data.data() as Map<String, dynamic>)['harga'] / 100);
  final hargaFix = (data.data() as Map<String, dynamic>)['harga'] - rumus;
  return InkWell(
    onTap: () => Get.toNamed(Routes.DETAIL, arguments: data),
    child: Container(
      height: tinggi * 0.41,
      width: lebar2,
      margin: EdgeInsets.fromLTRB(0, 15, 12, 15),
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
            height: tinggi * 0.21,
            padding: EdgeInsets.only(top: 10, right: 8, left: 8, bottom: 10),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: judul1),
                  ),
                ),
                SizedBox(
                  height: tinggi * 0.01,
                ),
                Text(
                  "Rp${hargaFix}00 ",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600, color: judul1),
                ),
                SizedBox(
                  height: tinggi * 0.006,
                ),
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 20,
                      margin: EdgeInsets.only(right: 6),
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
                  height: tinggi * 0.007,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 2),
                      child: Image.network(
                        (data.data() as Map<String, dynamic>)['statusToko'],
                        width: 15,
                      ),
                    ),
                    Text(
                      (data.data() as Map<String, dynamic>)['asalToko'],
                      style: TextStyle(
                        color: search,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: tinggi * 0.012,
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
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
