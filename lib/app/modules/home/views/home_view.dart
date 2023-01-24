import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: tinggi * 0.13,
              decoration: BoxDecoration(color: bgNav),
              padding: EdgeInsets.fromLTRB(15, 35, 15, 10),
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
                        prefixIcon: Icon(
                          IconlyLight.search,
                          size: 20,
                          color: search,
                        ),
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 1),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 1),
                          borderRadius: BorderRadius.circular(6),
                          gapPadding: 5,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 1),
                          gapPadding: 5,
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
                        Icon(
                          IconlyLight.more_square,
                          color: Colors.white,
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
            Container(
              width: lebar,
              height: tinggi * 0.15,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: tinggi * 0.4,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                ),
                items: [
                  'assets/banner.png',
                  'assets/banner2.png',
                  'assets/banner3.png'
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: lebar,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(i),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
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
                    style: TextStyle(color: bgNav, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            SizedBox(
              height: tinggi * 0.02,
            ),
            Container(
              width: lebar,
              height: tinggi * 0.4,
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
                    produk(
                        lebar,
                        125,
                        tinggi,
                        'assets/masker.png',
                        'Rp 1.000',
                        '92%',
                        'Rp 12.546',
                        'assets/menu/official.png',
                        'Kab. Tangerang'),
                    Container(
                      height: tinggi,
                      width: 125,
                      margin: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: lebar,
                            height: tinggi * 0.19,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: lebar,
                            height: tinggi * 0.163,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
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
                    style: TextStyle(color: bgNav, fontWeight: FontWeight.w600),
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
                      child: Image.asset('assets/diskon.png', fit: BoxFit.fill),
                    ),
                    Container(
                      height: tinggi * 0.35,
                      width: 130,
                      child: Image.asset('assets/diskon.png', fit: BoxFit.fill),
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
                    style: TextStyle(color: bgNav, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            SizedBox(
              height: tinggi * 0.01,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: tinggi * 0.4,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  produk(
                      lebar,
                      125,
                      tinggi,
                      'assets/mouse.png',
                      'Rp 609.000',
                      '44%',
                      'Rp 1.090.000',
                      'assets/populer.png',
                      'Kab. Bandung'),
                  produk(
                      lebar,
                      125,
                      tinggi,
                      'assets/mouse2.png',
                      'Rp 204.000',
                      '46%',
                      'Rp 379.000',
                      'assets/populer.png',
                      'Kab. Bandung'),
                  produk(
                      lebar,
                      125,
                      tinggi,
                      'assets/mouse3.png',
                      'Rp 239.000',
                      '32%',
                      'Rp 349.000',
                      'assets/populer.png',
                      'Kab. Bandung'),
                ]),
              ),
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
              child: Wrap(
                spacing: 3.5,
                runSpacing: 1,
                children: [
                  produk(
                      lebar,
                      lebar * 0.42,
                      tinggi,
                      'assets/mouse4.png',
                      'Rp 699.000',
                      '12%',
                      'Rp 790.000',
                      'assets/populer.png',
                      'Jakarta Pusat'),
                  produk(
                      lebar,
                      lebar * 0.42,
                      tinggi,
                      'assets/monitor.png',
                      'Rp 5.949.900',
                      '44%',
                      'Rp 1.090.000',
                      'assets/populer.png',
                      'Kota Depok'),
                  produk(
                      lebar,
                      lebar * 0.42,
                      tinggi,
                      'assets/stopkontak.png',
                      'Rp 3.750',
                      '44%',
                      'Rp 1.090.000',
                      'assets/populer.png',
                      'Kab. Tangerang'),
                  produk(
                      lebar,
                      lebar * 0.42,
                      tinggi,
                      'assets/mouse3.png',
                      'Rp 239.000',
                      '32%',
                      'Rp 349.000',
                      'assets/populer.png',
                      'Kab. Bandung'),
                ],
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: tinggi * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}

Widget Menu(image, text, tinggi) {
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

Widget produk(lebar, double lebar2, tinggi, gambar, harga, diskonPercen,
    jumlahDiskon, penjual, asal) {
  return InkWell(
    onTap: () => Get.toNamed(Routes.DETAIL),
    child: Container(
      height: tinggi * 0.36,
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
            height: tinggi * 0.19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              image: DecorationImage(
                  image: AssetImage(
                    gambar,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            width: lebar,
            height: tinggi * 0.163,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  harga,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: tinggi * 0.006,
                ),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 20,
                      margin: EdgeInsets.only(right: 6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: bgDiskon,
                      ),
                      child: Text(
                        diskonPercen,
                        style: TextStyle(
                            color: diskon,
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                    ),
                    Text(
                      jumlahDiskon,
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
                    Image.asset(
                      penjual,
                      width: 15,
                    ),
                    Text(
                      asal,
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
                      '4.8 | Terjual 312',
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
