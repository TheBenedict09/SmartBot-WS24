import 'package:flutter/material.dart';

class UserMessage extends StatelessWidget {
  final String message; // Added to hold the message text

  const UserMessage({
    super.key,
    required this.message, // Required parameter
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 5),
          
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width *
                0.7, // Adjust width as needed
          ),
          padding: const EdgeInsets.all(10.0),
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
          child: Text(
            message,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
