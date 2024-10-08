import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecproject/bindings/bindings.dart';
import 'package:wecproject/dashboard_bottomnav.dart';
import 'package:wecproject/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage(),),
        GetPage
        (name: '/dashboard', 
        page: () => DashboardPage(),
        binding: MyBindings()
        )
      ],
    );   
  }
}
