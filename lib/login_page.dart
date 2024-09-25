import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecproject/reuse_widget/button_login.dart';
import 'package:wecproject/reuse_widget/mycolor.dart';
import 'package:wecproject/reuse_widget/text_field_login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundpage,
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E1E1E), Color(0xFF2C2C2C)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                   const Text(
                  'Welcome to ',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: textcolor,
                  ),
                ),
                const SizedBox(height: 5),
                   Image.asset(
                  'image/ewc.png',
                  width: 230,
                  height: 100, 
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please login to continue',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                ReusableTextField(
                  controller: emailController,
                  hintText: 'Email',
                  icon: Icons.email,
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                ReusableTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                ReusableButton(
                  isLoading: _isLoading,
                  onPressed: _isLoading ? null : _handleLogin,
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: membiru),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _handleLogin() {
  final email = emailController.text;
  final password = passwordController.text;

  if (email == 'marcello@gmail.com' && password == 'marcello123') {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
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
}
