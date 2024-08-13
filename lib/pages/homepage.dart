import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:walmart_sparkathon_2024/components/botmessage.dart';
import 'package:walmart_sparkathon_2024/components/usermessage.dart';
import 'package:walmart_sparkathon_2024/utilities/colors.dart';
import 'package:walmart_sparkathon_2024/components/dialoguebox.dart';
import 'package:http/http.dart' as http;
import '../components/productrecommendation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isFocused = false;
  bool _isLoading = false;
  List<Widget> _messages = [];

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
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage(String message) async {
    setState(() {
      _messages.add(UserMessage(message: message));
      _isLoading = true;
    });

    _scrollToBottom();

    List<String> parts = message.split(' ');

    String query = parts.isNotEmpty ? parts[0] : '';
    double minPrice = parts.length > 1 ? double.tryParse(parts[1]) ?? 0.0 : 0.0;
    double maxPrice =
        parts.length > 2 ? double.tryParse(parts[2]) ?? 10000.0 : 10000.0;

    final String apiUrl =
        'http://107.21.134.59/search?query=$query&min_price=$minPrice&max_price=$maxPrice';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (!data['error']) {
          setState(() {
            _messages.add(
              ProductRecommendation(
                title: data['productName'],
                price: data['productPrice'],
                url: data['purchaseURL'],
              ),
            );
          });
        } else {
          setState(() {
            _messages.add(const BotMessage(message: 'No products found.'));
          });
        }
      } else {
        setState(() {
          _messages.add(const BotMessage(message: 'Server error occurred.'));
        });
      }
    } catch (e) {
      setState(() {
        _messages
            .add(const BotMessage(message: 'Failed to connect to the server.'));
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: c1.withOpacity(0.3),
        actions: [
          const CircleAvatar(
            backgroundImage: AssetImage('images/logo.png'),
            backgroundColor: Colors.transparent,
          ),
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
            child: Image.asset("images/BG.png", fit: BoxFit.cover),
          ),
          if (_isLoading)
            Center(
              child: Lottie.asset('animations/loading.json', width: 300),
            ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.14,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.72,
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.separated(
                controller: _scrollController,
                itemBuilder: (context, index) => _messages[index],
                separatorBuilder: (context, index) => SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.01,
                ),
                itemCount: _messages.length,
              ),
            ),
          ),
          DialogueBox(
            isFocused: _isFocused,
            focusNode: _focusNode,
            controller: _textController,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}
