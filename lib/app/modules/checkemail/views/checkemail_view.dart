import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/checkemail_controller.dart';

class CheckemailView extends GetView<CheckemailController> {
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: tinggi * 0.83,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 145,
                    height: 145,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12), color: kotak),
                    child: Image.asset('assets/fi-rr-envelope-open.png'),
                  ),
                  SizedBox(
                    height: tinggi * 0.045,
                  ),
                  Text(
                    'Check Your Email',
                    style: TextStyle(
                        color: judul,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: tinggi * 0.015,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'We have sent a password recover instructions to your email.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: subjudul,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: tinggi * 0.045,
                  ),
                  Container(
                    width: lebar * 0.45,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff0D8173)),
                      ),
                      child: Text(
                        'Open Email App',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: tinggi * 0.045,
                  ),
                  Text(
                    'Skip, I’ll confirm later',
                    style: TextStyle(
                        decoration: TextDecoration.underline, color: subjudul),
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text:
                        'Did not receive the email ? Check your spam filter, or ',
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: 'try another email address',
                    style: TextStyle(color: bglogin2))
              ]),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ));
  }
}
