import 'package:flutter/material.dart';
import 'package:walmart_sparkathon_2024/components/sidebar.dart';
import 'package:walmart_sparkathon_2024/utilities/colors.dart';
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
            width: MediaQuery.of(context).size.width * 0.01,
          )
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.2,
        backgroundColor: const Color(0xfffef7ff),
      ),
      body: Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Row(
              children: [
                SideBar(),
              ],
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.12,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.75,
              // color: Colors.amber,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return const BotMessage();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  );
                },
                itemCount: 35,
              ),
            ),
          ),
          DialogueBox(
            isFocused: _isFocused,
            focusNode: _focusNode,
          ),
        ],
      ),
    );
  }
}

class BotMessage extends StatelessWidget {
  const BotMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.2,
          height: MediaQuery.sizeOf(context).height * 0.1,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: 0.02,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23),
              bottomRight: Radius.circular(23),
              bottomLeft: Radius.circular(23),
            ),
          ),
        ),
      ),
    );
  }
}

class UserMessage extends StatelessWidget {
  const UserMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.2,
          height: MediaQuery.sizeOf(context).height * 0.1,
          decoration: BoxDecoration(
            color: c1,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(23),
              bottomRight: Radius.circular(23),
              bottomLeft: Radius.circular(23),
            ),
          ),
        ),
      ),
    );
  }
}
