import 'package:flutter/material.dart';

class Itemsofdetails extends StatelessWidget {
  final IconData icon;
  final VoidCallback callback;
  const Itemsofdetails({super.key, required this.icon, required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 104, 104, 104),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
