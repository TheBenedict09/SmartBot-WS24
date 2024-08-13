// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:walmart_sparkathon_2024/utilities/colors.dart';

class ProductRecommendation extends StatefulWidget {
  final String title;
  final String price;
  final String url;

  const ProductRecommendation({
    super.key,
    required this.title,
    required this.price,
    required this.url,
  });

  @override
  _ProductRecommendationState createState() => _ProductRecommendationState();
}

class _ProductRecommendationState extends State<ProductRecommendation> {
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    fetchImage(widget.title);
  }

  Future<void> fetchImage(String query) async {
    const apiKey = 'kswpGWh16Axx8tziziV6SLhsVrYnL13lHSuwAccnWNpkd3wRwyFAptGQ';
    final url =
        Uri.parse('https://api.pexels.com/v1/search?query=laptop&per_page=10');

    final response = await http.get(
      url,
      headers: {
        'Authorization': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['photos'].isNotEmpty) {
        setState(() {
          imageUrl = data['photos'][0]['src']['medium'];
        });
      }
    } else {
      throw Exception('Failed to load image');
    }
  }

  Future<void> _launchURL() async {
    if (await canLaunch(widget.url)) {
      await launch(widget.url);
    } else {
      throw 'Could not launch ${widget.url}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0, bottom: 10, top: 10),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.13,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: c1),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0.1,
                blurRadius: 5,
                color: c1,
                offset: const Offset(0, 1),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(23),
              bottomRight: Radius.circular(23),
              bottomLeft: Radius.circular(23),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageUrl != ''
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.1,
                        height: MediaQuery.sizeOf(context).height * 0.23,
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : const CircularProgressIndicator(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: Text(
                    "\$${widget.price}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              widget.url != ''
                  ? TextButton(
                      onPressed: _launchURL,
                      child: Text(
                        "Buy",
                        style: TextStyle(color: c1, fontSize: 17),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
