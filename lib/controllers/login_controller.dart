import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecproject/reuse_widget/mycolor.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  void handleLogin() {
    final email = emailController.text;
    final password = passwordController.text;

    if (email == 'marcello@gmail.com' && password == 'marcello123') {
      isLoading.value = true;

      Future.delayed(const Duration(seconds: 2), () {
        isLoading.value = false;
        Get.toNamed('/dashboard');
      });
    } else {
      Get.snackbar(
        "Error",
        "Email or password is incorrect",
        backgroundColor: Colors.red,
        colorText: textcolor,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}