import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/o_t_p_verification_controller.dart';

class OTPVerificationView extends GetView<OTPVerificationController> {
  final controller = Get.put(OTPVerificationController());
  final controllerAuth = Get.put(AuthControllerController());
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OTPVerificationController());
    final focusNode = FocusNode();
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;

//* <-- pinput -->
    const borderColor = Color.fromRGBO(30, 60, 87, 1);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      decoration: const BoxDecoration(),
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromRGBO(228, 217, 236, 1),
              const Color.fromRGBO(255, 255, 255, 1)
            ]),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Verification',
              style: TextStyle(
                  color: judul1, fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: tinggi * 0.015,
            ),
            Text(
              'Enter the code sent to the number',
              style: TextStyle(color: lineGray, fontSize: 14),
            ),
            SizedBox(
              height: tinggi * 0.015,
            ),
            Text(
              '+62 8151 764 6731',
              style: TextStyle(
                  color: subjudul, fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: tinggi * 0.06,
            ),
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: Pinput(
                  onSubmitted: (pin) => controllerAuth.checkOTP(pin),
                  length: 5,
                  pinAnimationType: PinAnimationType.slide,
                  controller: TextEditingController(),
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  showCursor: true,
                  cursor: cursor,
                  preFilledWidget: preFilledWidget,
                  onCompleted: (pin) => controllerAuth.checkOTP(pin),
                )),
            SizedBox(
              height: tinggi * 0.05,
            ),
            Container(
              width: lebar,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Color(0xff0D8173)),
                ),
                child: Text(
                  'Send code',
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
