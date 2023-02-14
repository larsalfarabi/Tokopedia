import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

import '../controllers/home_admin_controller.dart';

class HomeAdminView extends GetView<HomeAdminController> {
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      top: true,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () => Get.toNamed(Routes.SLIDER_DATA),
                    child: Menu(
                        'assets/menu/promo.png', 'Promo Hari Ini', tinggi)),
                Menu('assets/menu/toserba.png', 'Toserba', tinggi),
              ],
            ),
          ),
        ],
      ),
    ));
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
