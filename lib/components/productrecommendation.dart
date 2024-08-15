// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:walmart_sparkathon_2024/utilities/colors.dart';

class ProductRecommendation extends StatefulWidget {
  final String title;
  final String price;
  final String url;
  final String imageUrl; // Add this line to accept an image URL

  const ProductRecommendation({
    super.key,
    required this.title,
    required this.price,
    required this.url,
    required this.imageUrl, // Add this line to accept an image URL
  });

  @override
  _ProductRecommendationState createState() => _ProductRecommendationState();
}

class _ProductRecommendationState extends State<ProductRecommendation> {
  @override
  void initState() {
    super.initState();
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
            gradient: const RadialGradient(
              colors: [
                // c1,
                // Color.fromARGB(255, 95, 144, 243),
                // Color.fromARGB(255, 135, 172, 244),
                Color.fromARGB(255, 175, 200, 245),
                Color.fromARGB(255, 215, 228, 246),
                // Colors.white,
              ],
              center: Alignment.bottomRight,
              radius: 1.0,
            ),
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
              widget.imageUrl != ''
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.1,
                        height: MediaQuery.sizeOf(context).height * 0.23,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                          ),
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
