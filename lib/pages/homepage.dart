import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffe3737).withOpacity(0.3),
        actions: [
          CircleAvatar(),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.01,
          )
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.sizeOf(context).width * 0.2,
        backgroundColor: const Color(0xfffef7ff),
      ),
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          children: [SideBar()],
        ),
      ),
    );
  }
}

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
