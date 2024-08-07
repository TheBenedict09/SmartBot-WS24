import 'package:flutter/material.dart';
import 'package:walmart_sparkathon_2024/components/botmessage.dart';
import 'package:walmart_sparkathon_2024/components/sidebar.dart';
import 'package:walmart_sparkathon_2024/utilities/colors.dart';
import 'package:walmart_sparkathon_2024/components/dialoguebox.dart';

import '../components/productrecommendation.dart';

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
        // title: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.add),
        // ),

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
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  return ProductRecommendation();
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
