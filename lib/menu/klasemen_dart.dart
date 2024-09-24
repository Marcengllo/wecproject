import 'package:flutter/material.dart';

class klasemenMenu extends StatefulWidget {
  const klasemenMenu({super.key});

  @override
  State<klasemenMenu> createState() => _klasemenMenuState();
}

class _klasemenMenuState extends State<klasemenMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("ini Klasemen menu"),),
    );
  }
}