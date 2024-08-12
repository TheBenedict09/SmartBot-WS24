import 'package:flutter/material.dart';
import 'package:walmart_sparkathon_2024/utilities/colors.dart';

class UserMessage extends StatelessWidget {
  final String message; // Added to hold the message text

  const UserMessage({
    super.key,
    required this.message, // Required parameter
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.7, // Adjust width as needed
          ),
          padding: const EdgeInsets.all(10.0), // Added padding inside the container
          decoration: BoxDecoration(
            color: c1,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(23),
              bottomRight: Radius.circular(23),
              bottomLeft: Radius.circular(23),
            ),
          ),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
