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
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.13,
        decoration: BoxDecoration(
          border: Border.all(color: c1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.1,
                height: MediaQuery.sizeOf(context).height * 0.23,
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(title),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8),
                child: Text(price),
              ),
            ),
            TextButton(
              onPressed: _launchURL, // Use the _launchURL function
              child: Text(
                "Buy",
                style: TextStyle(color: c1, fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
