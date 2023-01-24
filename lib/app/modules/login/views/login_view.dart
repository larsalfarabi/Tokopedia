import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Obx(
      () => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: tinggi * 0.85,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Welcome Back!👋',
                        style: TextStyle(
                          color: judul1,
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                        ),
                      ),
                      SizedBox(
                        height: tinggi * 0.015,
                      ),
                      Text(
                        'Hello again, you’ve been missed!',
                        style: TextStyle(color: subjudul),
                      ),
                      SizedBox(
                        height: tinggi * 0.045,
                      ),
                      Text(
                        'Email Address',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: judul1),
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
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            hintText: "Enter your Email",
                            hintStyle: TextStyle(
                              color: subjudul,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: lineGray),
                                borderRadius: BorderRadius.circular(6)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: lineGray),
                                borderRadius: BorderRadius.circular(6)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: tinggi * 0.025,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: judul1),
                      ),
                      SizedBox(
                        height: tinggi * 0.012,
                      ),
                      Container(
                        width: lebar,
                        height: 50,
                        child: TextField(
                          cursorColor: judul1,
                          obscureText: controller.showEyes.value,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              hintText: "Enter Your Password",
                              hintStyle: TextStyle(
                                color: subjudul,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: lineGray),
                                  borderRadius: BorderRadius.circular(6)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: lineGray),
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
                        height: tinggi * 0.012,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () => Get.toNamed(Routes.RESETPASSWORD),
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(color: subjudul),
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
                          onPressed: () => Get.offNamed(Routes.HOME),
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff0D8173)),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 16),
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
                            child: Divider(color: lineGray),
                          ),
                          Text(
                            'Or Login With',
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 14),
                          ),
                          Container(
                            width: lebar * 0.25,
                            child: Divider(color: lineGray),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: tinggi * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: lebar * 0.42,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: lineGray, width: 1),
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
                          Container(
                            width: lebar * 0.42,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: lineGray, width: 1),
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
                          onTap: () => Get.offNamed(Routes.REGISTER),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Color(0xff0D8173),
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
