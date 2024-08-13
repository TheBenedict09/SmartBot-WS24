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
        color: Color.fromARGB(255, 250, 238, 240),
        boxShadow: [
          BoxShadow(
            blurRadius: 30.3,
            spreadRadius: 0.01,
            offset: Offset(-40, 25),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffd8e4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  // color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
