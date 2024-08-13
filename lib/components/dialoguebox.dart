// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:walmart_sparkathon_2024/utilities/colors.dart';

class DialogueBox extends StatefulWidget {
  const DialogueBox({
    super.key,
    required this.isFocused,
    required this.focusNode,
    required this.controller,
    required this.onSend,
  });

  final bool isFocused;
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function(String) onSend;

  @override
  _DialogueBoxState createState() => _DialogueBoxState();
}

class _DialogueBoxState extends State<DialogueBox> {
  Future<void> _sendMessage() async {
    final String query = widget.controller.text;
    if (query.isEmpty) return;

    widget.onSend(query); // Pass query to the parent function

    widget.controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.sizeOf(context).height * 0.75,
      left: (MediaQuery.sizeOf(context).width -
              MediaQuery.sizeOf(context).width * 0.6) /
          2,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.6,
        height: MediaQuery.sizeOf(context).height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            width: 1,
            color: widget.isFocused ? c1 : Colors.black,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: widget.focusNode,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Ask Me Anything...",
                  ),
                  maxLines: null,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: _sendMessage,
                    color: widget.isFocused ? c1 : Colors.black,
                    icon: const Icon(
                      Icons.send,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
