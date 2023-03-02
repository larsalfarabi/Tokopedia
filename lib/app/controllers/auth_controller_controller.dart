// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

class AuthControllerController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  String codeVerification = '';
  Stream<User?> streamAuthStatus() => auth.authStateChanges();
  login(String emailAddress, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
          title: "Error!",
          middleText: 'No user found for that email.',
          backgroundColor: Colors.red,
          titleStyle: TextStyle(color: Colors.white),
          middleTextStyle: TextStyle(color: Colors.white),
        );
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
          title: 'Error!',
          middleText: 'Wrong password provided for that user.',
          backgroundColor: Colors.red,
          titleStyle: TextStyle(color: Colors.white),
          middleTextStyle: TextStyle(color: Colors.white),
        );
      }
    }
  }

  logout() {
    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda ingi LogOut?",
        confirm: ElevatedButton(
          onPressed: () async {
            await auth.signOut();
            Get.offAllNamed(Routes.LOGIN);
          },
          child: Text('YES'),
        ),
        cancel: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () => Get.back(),
          child: Text('NO'),
        ),
      );
    } catch (err) {
      print(err);
    }
  }

  register(String emailAddress, String password) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      credential.user?.sendEmailVerification();
      Get.offAllNamed(Routes.CHECKEMAIL);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
          title: 'Error!',
          middleText: 'The password provided is too weak.',
          backgroundColor: Colors.red,
          titleStyle: TextStyle(color: Colors.white),
          middleTextStyle: TextStyle(color: Colors.white),
        );
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
          title: 'Error!',
          middleText: 'The account already exists for that email.',
          backgroundColor: Colors.red,
          titleStyle: TextStyle(color: Colors.white),
          middleTextStyle: TextStyle(color: Colors.white),
        );
      }
    }
  }

  resetPassword(String email) async {
    try {
      final credential = await auth.sendPasswordResetEmail(email: email);
      Get.offAllNamed(Routes.CHECKEMAIL);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
          title: "Error!",
          middleText: 'No user found for that email.',
          backgroundColor: Colors.red,
          titleStyle: TextStyle(color: Colors.white),
          middleTextStyle: TextStyle(color: Colors.white),
        );
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    Get.offAllNamed(Routes.HOME);
    // Once signed in, return the UserCredential
    return await auth.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    // Get.offAllNamed(Routes.HOME);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  verifyPhone(String nomor) async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+62${nomor}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          if (value.user != null) {
            Get.offAllNamed(Routes.HOME);
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.defaultDialog(
          title: "Error!",
          middleText: 'gagal mengirim pesan verifikasi',
          backgroundColor: Colors.red,
          titleStyle: TextStyle(color: Colors.white),
          middleTextStyle: TextStyle(color: Colors.white),
        );
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        codeVerification = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        codeVerification = verificationId;
      },
      timeout: Duration(seconds: 60),
    );
    Get.offAllNamed(Routes.O_T_P_VERIFICATION, parameters: {'phone': nomor});
  }

  checkOTP(String smsCode) async {
    try {
      await auth
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: codeVerification, smsCode: smsCode))
          .then((value) {
        if (value.user != null) {
          Get.offAllNamed(Routes.HOME);
        }
      });
    } catch (e) {
      Get.defaultDialog(
        title: "Error!",
        middleText: 'gagal mengirim kode OTP',
        backgroundColor: Colors.red,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
      );
    }
  }
}
