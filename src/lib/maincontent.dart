import 'package:flutter/material.dart';
import 'tools/screen_scale.dart';
import 'mainframes/head.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    final double referenceWidth = screenScale(context, 2/3).width;
    final double spaceBetween = screenScale(context, 1/3).height;

    return SingleChildScrollView(
      child: Column(
        children: [
          const HeadFrame(),
          SizedBox(height: spaceBetween),
          Container(
            color: Colors.green,
            width: referenceWidth,
            height: referenceWidth,
          ),
          SizedBox(height: spaceBetween),
          Container(
            color: Colors.blue,
            width: referenceWidth,
            height: referenceWidth,
          ),
        ],
      ),
    );
  }
}
