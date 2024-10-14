import 'package:flutter/material.dart';
import 'package:wecproject/reuse_widget/mycolor.dart';

class ReusableButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;

  const ReusableButton({
    Key? key,
    required this.isLoading,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: textcolor)
            : const Text(
                'Login',
                style: TextStyle(fontSize: 18,color: textcolor),
              ),
      ),
    );
  }
}