import 'package:flutter/material.dart';
import 'package:walmart_sparkathon_2024/colors.dart';

class DialogueBox extends StatelessWidget {
  const DialogueBox({
    super.key,
    required bool isFocused,
    required FocusNode focusNode,
  }) : _isFocused = isFocused, _focusNode = focusNode;

  final bool _isFocused;
  final FocusNode _focusNode;

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
            color: _isFocused ? c1 : Colors.black,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  focusNode: _focusNode,
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
                    onPressed: () => {},
                    color: _isFocused ? c1 : Colors.black,
                    icon: const Icon(
                      Icons.mic,
                    ),
                  ),
                  const VerticalDivider(),
                  IconButton(
                    onPressed: () {},
                    color: _isFocused ? c1 : Colors.black,
                    icon: const Icon(
                      Icons.send,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
