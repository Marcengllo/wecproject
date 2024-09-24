import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecproject/controllers/dashboard_controller.dart';
import 'package:wecproject/menu/home_page.dart';
import 'package:wecproject/menu/klasemen_dart.dart';
import 'package:wecproject/menu/profile_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = 
    Get.put(DashboardController());

    final List<Widget> menus = [HomeMenu(), klasemenMenu(), ProfileMenu()];

    return Obx((){
            return Scaffold(
        body: menus[dashboardController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: dashboardController.selectedIndex.value,
          onTap: dashboardController.changeMenu,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_motorsports), label: "Klasemen"),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: "Profile")
          ],
           backgroundColor: Colors.black,
          selectedItemColor: Colors.blue, 
          unselectedItemColor: Colors.white, 
          type: BottomNavigationBarType.fixed,
        ),
      );
    }) ;
  }
}