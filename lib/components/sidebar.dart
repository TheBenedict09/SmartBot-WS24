import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.sizeOf(context).width * 0.035,
      decoration: const BoxDecoration(
        color: Color(0xfffef7ff),
        boxShadow: [
          BoxShadow(
            blurRadius: 30.3,
            spreadRadius: 0.0001,
            offset: Offset(-20, 15),
          ),
        ],
      ),
    );
  }
}
