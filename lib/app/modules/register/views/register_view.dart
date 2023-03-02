import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final controller = Get.put(RegisterController());
  final controllerAuth = Get.put(AuthControllerController());
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Obx(
        () => Container(
          height: tinggi,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                height: tinggi * 0.95,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(IconlyLight.arrow_left, size: 24),
                        SizedBox(
                          height: tinggi * 0.025,
                        ),
                        Text(
                          'Create Account',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: tinggi * 0.015,
                        ),
                        Text(
                          'Connect with your friends today!',
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                        SizedBox(
                          height: tinggi * 0.045,
                        ),
                        Text(
                          'Email Address',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: tinggi * 0.012,
                        ),
                        Container(
                          width: lebar,
                          height: 50,
                          child: TextField(
                            controller: controller.email,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              hintText: "Enter your Email",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(6)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: tinggi * 0.02,
                        ),
                        Text(
                          'Mobile Number',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
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
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              hintText: "Enter your mobile number",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(6)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey.shade300),
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
                                        style: TextStyle(
                                            color: subjudul, fontSize: 17),
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
                          height: tinggi * 0.02,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: tinggi * 0.012,
                        ),
                        Container(
                          width: lebar,
                          height: 50,
                          child: TextField(
                            controller: controller.password,
                            cursorColor: Colors.black,
                            obscureText: controller.showEyes.value,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                hintText: "Enter Your Password",
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(6)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(6)),
                                suffixIcon: IconButton(
                                    onPressed: () => controller.changeEye(),
                                    icon: Icon(
                                      controller.showEyes.value
                                          ? IconlyLight.show
                                          : IconlyLight.hide,
                                      color: Colors.black,
                                    ))),
                          ),
                        ),
                        SizedBox(
                          height: tinggi * 0.04,
                        ),
                        Container(
                          width: lebar,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () => controllerAuth.register(
                                controller.email.text,
                                controller.password.text),
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff0D8173)),
                            ),
                            child: Text(
                              'Sign Up',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: tinggi * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: lebar * 0.25,
                              child: Divider(color: Colors.grey.shade500),
                            ),
                            Text(
                              'Or Sign Up With',
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 14),
                            ),
                            Container(
                              width: lebar * 0.25,
                              child: Divider(color: Colors.grey.shade500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: tinggi * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => controllerAuth.signInWithFacebook(),
                              child: Container(
                                width: lebar * 0.42,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.shade300, width: 1),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/Facebook.png'),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Facebook',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: lebar * 0.42,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.shade300, width: 1),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/Google.png'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Google',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t have an account? ',
                              style: TextStyle(
                                color: Color(0xff1B1B1B),
                              ),
                            ),
                            InkWell(
                                onTap: () => Get.offNamed(Routes.LOGIN),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Color(0xff0D8173),
                                      fontWeight: FontWeight.w500),
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
