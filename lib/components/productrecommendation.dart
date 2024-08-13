// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package
import 'package:walmart_sparkathon_2024/utilities/colors.dart';

class ProductRecommendation extends StatelessWidget {
  const ProductRecommendation({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.url,
  });

  final String title;
  final String image;
  final String price;
  final String url;

  // Function to launch the URL
  Future<void> _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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
                spreadRadius: 0.2,
                blurRadius: 10,
                color: c1,
                offset: const Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image != ''
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.1,
                        height: MediaQuery.sizeOf(context).height * 0.23,
                        child: Image.network(
                          image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : const SizedBox(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
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
                    "\$$price",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              url != ''
                  ? TextButton(
                      onPressed: _launchURL, // Use the _launchURL function
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
