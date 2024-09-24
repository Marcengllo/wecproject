import 'package:flutter/material.dart';
import 'package:wecproject/reuse_widget/profile_options.dart';

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({super.key});

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
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
                  backgroundImage: NetworkImage('https://example.com/path/to/image.jpg'),
                ),
                const SizedBox(height: 10),
                Text(
                  "Marcello Rosyi",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "marcello@gmail.com",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
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
                color: Colors.white,
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
            onTap: () {
            },
          ),
          ProfileOption(
            title: 'Privacy Policy',
            icon: Icons.arrow_forward_ios,
            onTap: () {
            },
          ),
          ProfileOption(
            title: 'Log Out',
            icon: Icons.logout,
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
