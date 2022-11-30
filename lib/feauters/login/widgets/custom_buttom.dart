import 'package:flutter/material.dart';
import 'package:movieapp/common/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
          color: bottomcolor, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
