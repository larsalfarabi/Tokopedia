import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/resetpassword_controller.dart';

class ResetpasswordView extends GetView<ResetpasswordController> {
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: Icon(
                IconlyLight.arrow_left,
                size: 24,
              ),
            ),
            SizedBox(
              height: tinggi * 0.025,
            ),
            Text(
              'Reset Password',
              style: TextStyle(
                  color: judul1, fontSize: 26, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: tinggi * 0.015,
            ),
            Text(
              'Enter the email associated with your account and we’ll send an email with instructions to reset your password.',
              style: TextStyle(color: subjudul, fontSize: 14),
            ),
            SizedBox(
              height: tinggi * 0.045,
            ),
            Text(
              'Email Address',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: judul1),
            ),
            SizedBox(
              height: tinggi * 0.012,
            ),
            Container(
              width: lebar,
              height: 50,
              child: TextField(
                cursorColor: judul1,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  hintText: "Enter your Email",
                  hintStyle: TextStyle(
                    color: subjudul,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: lineGray),
                      borderRadius: BorderRadius.circular(6)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: lineGray),
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
            ),
            SizedBox(
              height: tinggi * 0.04,
            ),
            Container(
              width: lebar,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Get.toNamed(Routes.CHECKEMAIL),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Color(0xff0D8173)),
                ),
                child: Text(
                  'Send Instructions',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
