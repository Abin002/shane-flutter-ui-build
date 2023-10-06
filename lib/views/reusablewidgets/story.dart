import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  final String imagePath;
  final String text;

  StoryCircle({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, bottom: 8),
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(
                imagePath,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
