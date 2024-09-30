import 'package:flutter/material.dart';
import 'package:wecproject/reuse_widget/mycolor.dart';

class ProfileOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileOption({Key? key, required this.title, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(color: textcolor),
          ),
          trailing: Icon(
            icon,
            color: textcolor,
          ),
          onTap: onTap,
        ),
        const Divider(color: Colors.white54),
      ],
    );
  }
}