import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecproject/controllers/history_controller.dart';
import 'package:wecproject/model/model_card.dart';
import 'package:wecproject/reuse_widget/card_info.dart';
import 'package:wecproject/reuse_widget/mycolor.dart';
import 'package:wecproject/reuse_widget/text_profile.dart';
import 'package:wecproject/reuse_widget/profile_options.dart';

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({super.key});

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  final HistoryController historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundpage,
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: textcolor),
        ),
        backgroundColor: membiru,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://cdn-4.motorsport.com/images/amp/0k7kbv80/s1000/ayrton-senna-1.jpg'),
                ),
                const SizedBox(height: 10),
                ReusableText(
                  text: "Marcello Rosyi",
                  color: textcolor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 5),
                ReusableText(
                  text: "marcello@gmail.com",
                  color: textcolor,
                  fontSize: 16,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Obx(() {
            List<modelcard> historyList = historyController.viewedCards.reversed.take(4).toList();
            if (historyList.isEmpty) {
              return Center(
                child: Text(
                  "No recently viewed items",
                  style: TextStyle(color: textcolor, fontSize: 16),
                ),
              );
            }
            return Cardinfo(
              itemcard: historyList,
              title: "Recently Viewed",
            );
          }),
          const SizedBox(height: 10),
          ProfileOption(
            title: 'Contact us',
            icon: Icons.arrow_forward_ios,
            onTap: () {},
          ),
          ProfileOption(
            title: 'Privacy Policy',
            icon: Icons.arrow_forward_ios,
            onTap: () {},
          ),
          ProfileOption(
            title: 'Log Out',
            icon: Icons.logout,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
