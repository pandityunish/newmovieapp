import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final Icon icon;
  final String hinttext;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  const CustomFormField(
      {super.key,
      required this.controller,
      required this.icon,
      required this.hinttext,
      required this.inputType,
      required this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            hintText: hinttext,
            prefixIcon: icon,
            fillColor: Colors.white,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
