import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(children: [
        Text('Hi, Welcome Back!'),
        Text('Hello again, you`ve been missed!')
      ],)
    );
  }
}
