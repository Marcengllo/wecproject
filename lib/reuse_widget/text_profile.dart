import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight? fontWeight; // Optional fontWeight

  const ReusableText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 16,
    this.fontWeight, // Bisa tidak disertakan
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal, // Default fontWeight
      ),
    );
  }
}