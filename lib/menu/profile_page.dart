import 'package:flutter/material.dart';
import 'package:wecproject/reuse_widget/mycolor.dart';
import 'package:wecproject/reuse_widget/profile_options.dart';
import 'package:wecproject/reuse_widget/text_profile.dart';

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({super.key});

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundpage,
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: textcolor),
        ),
        backgroundColor: Colors.blue,
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
                  backgroundImage:
                      NetworkImage('https://example.com/path/to/image.jpg'),
                ),
                const SizedBox(height: 10),
                ReusableText(
                  text: "Marcello Rosyi",
                  color: textcolor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold, // Menentukan fontWeight
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
          Align(
            alignment: Alignment.centerLeft,
            child: const Text(
              "Favorite Replay",
              style: TextStyle(
                color: textcolor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Card(
                  color: Colors.grey[400],
                  child: SizedBox(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Replay 1",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Card(
                  color: Colors.grey[400],
                  child: SizedBox(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Replay 2",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
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
