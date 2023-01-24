import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
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
                padding: EdgeInsets.fromLTRB(15, 35, 15, 10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(IconlyLight.arrow_left)),
                    ),
                    Container(
                      width: lebar * 0.5,
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
                            borderSide: BorderSide(color: lineGray, width: 1),
                            borderRadius: BorderRadius.circular(6),
                            gapPadding: 5,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide:
                                const BorderSide(color: lineGray, width: 1),
                            gapPadding: 5,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: lebar * 0.322,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.share,
                            color: Colors.black,
                          ),
                          Icon(
                            IconlyLight.buy,
                            color: Colors.black,
                          ),
                          Icon(
                            IconlyLight.more_square,
                            color: Colors.black,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: lebar,
                height: tinggi * 0.43,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/parfum.png"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: tinggi * 0.015,
              ),
              Container(
                width: lebar,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rp370.000',
                      style: TextStyle(
                          color: judul1,
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    ),
                    Icon(
                      IconlyLight.heart,
                      color: judul1,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                width: lebar,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Mine. Perfumery ETHEREAL - 50ml Eau De Parfum',
                  style: TextStyle(fontSize: 16.5),
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                width: lebar,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Text('Terjual 250+'),
                      ),
                      Container(
                        width: lebar * 0.25,
                        height: 35,
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1, color: shadow)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              IconlyBold.star,
                              color: star,
                              size: 18,
                            ),
                            Text(
                              '4.9 (320)',
                              style: TextStyle(color: subjudul2),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: lebar * 0.35,
                        height: 35,
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1, color: shadow)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Foto Pembeli (50)',
                              style: TextStyle(color: subjudul2),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: lebar * 0.25,
                        height: 35,
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1, color: shadow)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Diskusi (25)',
                              style: TextStyle(color: subjudul2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              pembatas(lebar),
              SizedBox(
                height: tinggi * 0.02,
              ),
              heading('Detail Produk'),
              SizedBox(
                height: tinggi * 0.02,
              ),
              detailProduk(lebar, 'Detail produk', '200 g'),
              SizedBox(
                height: tinggi * 0.01,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  thickness: 1,
                  color: shadow,
                ),
              ),
              detailProduk2(lebar, 'Etalase', 'Mine Private Collection'),
              SizedBox(
                height: tinggi * 0.01,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  thickness: 1,
                  color: shadow,
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              heading('Deskripsi produk'),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Mine. ETHEREAL Eau De Parfum 50mi glass perfume bottle in hard box packaging • ETHEREAL • With facets that highlight a side ...',
                  style: TextStyle(color: judul1, fontSize: 15),
                ),
              ),
              SizedBox(
                height: tinggi * 0.01,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Baca Selengkapnya',
                  style: TextStyle(
                    color: bgNav,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                width: lebar,
                child: Divider(
                  color: kotak2,
                  thickness: 1,
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/parfum2.png'),
                        SizedBox(
                          width: lebar * 0.015,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/menu/official.png',
                                    width: 18),
                                Text(
                                  ' Mine. Parfumery',
                                  style: TextStyle(
                                      color: judul1,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                )
                              ],
                            ),
                            SizedBox(
                              height: tinggi * 0.01,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: 'Online',
                                  style: TextStyle(color: subjudul3),
                                ),
                                TextSpan(
                                  text: ' 23 Jam lalu',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: subjudul3),
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: tinggi * 0.006,
                            ),
                            Text('Kota Tangerang'),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: lebar * 0.2,
                      height: 37,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: bgNav)),
                      child: Text(
                        'Follow',
                        style: TextStyle(
                            color: bgNav,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.025,
              ),
              pembatas(lebar),
              SizedBox(
                height: tinggi * 0.02,
              ),
              heading2('Pilihan Promo Hari Ini'),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      produk(
                        lebar,
                        lebar * 0.42,
                        tinggi,
                        'assets/parfum3.png',
                        'Rp 370.000',
                        'assets/populer.png',
                        'Kota Tangerang',
                      ),
                      produk(
                        lebar,
                        lebar * 0.42,
                        tinggi,
                        'assets/parfun4.png',
                        'Rp 450.000',
                        'assets/populer.png',
                        'Kota Tangerang',
                      ),
                      produk(
                        lebar,
                        lebar * 0.42,
                        tinggi,
                        'assets/parfun4.png',
                        'Rp 450.000',
                        'assets/populer.png',
                        'Kota Tangerang',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: tinggi * 0.025,
              ),
              pembatas(lebar),
              SizedBox(
                height: tinggi * 0.02,
              ),
              heading2('Ulasan Pembali'),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Icon(
                      IconlyBold.star,
                      color: star,
                      size: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      child: Text(
                        '4.9',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      '320 rating ∙ 102 ulasan',
                      style: TextStyle(color: subjudul3),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    review('assets/review.png', ''),
                    review('assets/review2.png', ''),
                    review('assets/review3.png', ''),
                    review('assets/review4.png', ''),
                    review('assets/review5.png', '+61'),
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  thickness: 1,
                  color: shadow,
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      child: Image.asset('assets/orang.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Zain Ekstrom Bothman',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '31 ulasan lengkap ∙ 17 terbantu',
                          style: TextStyle(color: subjudul3),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.01,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          IconlyBold.star,
                          color: star,
                          size: 15,
                        ),
                        Icon(
                          IconlyBold.star,
                          color: star,
                          size: 15,
                        ),
                        Icon(
                          IconlyBold.star,
                          color: star,
                          size: 15,
                        ),
                        Icon(
                          IconlyBold.star,
                          color: star,
                          size: 15,
                        ),
                        Icon(
                          IconlyBold.star,
                          color: star,
                          size: 15,
                        ),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 7),
                        child: Text(
                          '10 bulan lalu',
                          style: TextStyle(color: subjudul3),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.01,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'saya selalu tertarik dengan produk lokal, buat saya aroma nomor 2 karena subyektif, Kemasan nomor selanjutnya, tapi yang perlu di',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: tinggi * 0.01,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Baca Selengkapnya',
                  style: TextStyle(
                    color: bgNav,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              pembatas(lebar),
              SizedBox(
                height: tinggi * 0.02,
              ),
              heading2('Diskusi'),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Image.asset('assets/orang2.png'),
                    Container(
                      padding: EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Text(
                            'Rayna Stanton',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: judul1,
                                fontSize: 15),
                          ),
                          Text(
                            ' ∙ Apr 2022',
                            style: TextStyle(color: subjudul3),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.01,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'hai! kira-kira kapan restock lagi? thanks in      advance',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: tinggi * 0.01,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/penjual.png'),
                        Container(
                            width: 60,
                            height: 25,
                            margin: EdgeInsets.only(left: 12),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: bgCashback,
                            ),
                            child: Text(
                              'Penjual',
                              style: TextStyle(
                                  color: bgNav, fontWeight: FontWeight.w600),
                            )),
                        Text(
                          '∙ Apr 2022',
                          style: TextStyle(color: subjudul3),
                        )
                      ],
                    ),
                    SizedBox(
                      height: tinggi * 0.01,
                    ),
                    Text(
                      'Halo kak, maaf banget yak karena kamu jadi nunggu saat ini kita masih out of stock ya ...',
                      style: TextStyle(color: judul1, fontSize: 14.3),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              pembatas(lebar),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.only(right: 14),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: judul1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        '!',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: judul1),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Produk bermasalah? ',
                          style: TextStyle(color: judul1),
                        ),
                        Text(
                          'Laporkan',
                          style: TextStyle(
                            color: bgNav,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: tinggi * 0.02,
              ),
              Container(
                width: lebar,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(width: 1.5, color: footer))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.5, color: lineGray),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          IconlyLight.chat,
                          size: 26,
                        ),
                      ),
                      Container(
                          width: lebar * 0.375,
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.5, color: bgNav),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Beli Langsung',
                            style: TextStyle(
                                color: bgNav,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          )),
                      Container(
                          width: lebar * 0.375,
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: bgNav,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '+Keranjang',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          )),
                    ]),
              )
            ],
          ),
        ));
  }
}

Widget detailProduk(lebar, judul, subJudul) {
  return Container(
    width: lebar,
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 65),
          child: Text(
            judul,
            style: TextStyle(color: subjudul3, fontSize: 16),
          ),
        ),
        Text(
          subJudul,
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}

Widget detailProduk2(lebar, judul, subJudul) {
  return Container(
    width: lebar,
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 108),
          child: Text(
            judul,
            style: TextStyle(color: subjudul3, fontSize: 16),
          ),
        ),
        Text(
          subJudul,
          style: TextStyle(
              fontSize: 16, color: bgNav, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

Widget heading(judul) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Text(
      judul,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
  );
}

Widget heading2(judul) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          judul,
          style: TextStyle(
            color: judul1,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Lihat Semua',
          style: TextStyle(color: bgNav, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

Widget pembatas(lebar) {
  return Container(
    width: lebar,
    height: 8,
    color: kotak2,
  );
}

Widget review(gambar, judul) {
  return Container(
    width: 60,
    height: 60,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      image: DecorationImage(image: AssetImage(gambar)),
    ),
    child: Text(
      judul,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
    ),
  );
}

Widget produk(lebar, double lebar2, tinggi, gambar, harga, penjual, asal) {
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
                      width: 60,
                      height: 20,
                      margin: EdgeInsets.only(right: 6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: bgCashback,
                      ),
                      child: Text(
                        'Cashback',
                        style: TextStyle(
                          color: bgNav,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
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
