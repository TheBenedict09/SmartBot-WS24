import 'package:flutter/material.dart';
import 'package:walmart_sparkathon_2024/colors.dart';
import 'package:walmart_sparkathon_2024/components/dialoguebox.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: c1.withOpacity(0.3),
        actions: [
          const CircleAvatar(),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.01,
          )
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.sizeOf(context).width * 0.2,
        backgroundColor: const Color(0xfffef7ff),
      ),
      body: Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Row(
              children: [SideBar()],
            ),
          ),
          DialogueBox(isFocused: _isFocused, focusNode: _focusNode)
        ],
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
