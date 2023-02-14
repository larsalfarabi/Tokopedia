import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/login_with_phone_number_controller.dart';
// import 'package:pinput/pinput.dart';

class LoginWithPhoneNumberView extends GetView<LoginWithPhoneNumberController> {
  final controller = Get.put(LoginWithPhoneNumberController());
  final controllerAuth = Get.put(AuthControllerController());
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
            Text(
              'Login with Phone Number',
              style: TextStyle(
                  color: judul1, fontSize: 26, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: tinggi * 0.015,
            ),
            Text(
              'Login with your own beautiful phone number',
              style: TextStyle(color: subjudul, fontSize: 14),
            ),
            SizedBox(
              height: tinggi * 0.06,
            ),
            Text(
              'Mobile Number',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: tinggi * 0.012,
            ),
            Container(
              width: lebar,
              height: 50,
              child: TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.phone,
                controller: controller.phone,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  hintText: "Enter your mobile number",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(6)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(6)),
                  prefixIcon: Container(
                    width: lebar * 0.2,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Text(
                            '+62',
                            style: TextStyle(color: subjudul, fontSize: 17),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: VerticalDivider(
                            color: lineGray,
                            width: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: tinggi * 0.05,
            ),
            Container(
              width: lebar,
              height: 50,
              child: ElevatedButton(
                onPressed: () =>
                    controllerAuth.verifyPhone(controller.phone.text),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Color(0xff0D8173)),
                ),
                child: Text(
                  'Send OTP',
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
