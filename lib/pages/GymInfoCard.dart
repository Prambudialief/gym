import 'package:flutter/material.dart';

class GymInfoCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const GymInfoCard({
  Key? key,
  required this.title,
  required this.imageUrl,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl, width: 130, height: 130, fit: BoxFit.cover),
          SizedBox(height: 12,
          ),
          Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
        ],
      ),
      ),
    );
  }
}