import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: tinggi,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [bglogin, bglogin2]),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: tinggi * 0.85,
                child: Column(
                  children: [
                    Container(
                      height: tinggi * 0.3,
                      width: lebar,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/sp.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: tinggi * 0.05,
                    ),
                    Text(
                      'Let`s Get Started',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: tinggi * 0.024,
                    ),
                    Text(
                      'Connect with each other with chatting or calling. Enjoy safe and private texting',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: tinggi * 0.09,
                    ),
                    Container(
                      width: lebar,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => Get.toNamed(Routes.LOGIN),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Text(
                          'Join Now',
                          style:
                              TextStyle(color: Color(0xff0D8173), fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
