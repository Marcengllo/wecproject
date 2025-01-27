import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecproject/dashboard_bottomnav.dart';
import 'package:wecproject/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage(),),
        GetPage(name: '/dashboard', page: () => DashboardPage(),)
      ],
    );   
  }
}
