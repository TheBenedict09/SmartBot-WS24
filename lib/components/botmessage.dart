import 'package:flutter/material.dart';
import 'package:walmart_sparkathon_2024/utilities/colors.dart';

class BotMessage extends StatelessWidget {
  const BotMessage({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.2,
          // height: MediaQuery.sizeOf(context).height * 0.1,
          padding: const EdgeInsets.all(10.0),

          decoration: BoxDecoration(
            color: c1,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(23),
              bottomRight: Radius.circular(23),
              bottomLeft: Radius.circular(23),
            ),
          ),
          child: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
