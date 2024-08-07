import 'package:flutter/material.dart';
import 'tools/screen_scale.dart';
import 'mainframes/head.dart';
import 'mainframes/about.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    final double referenceWidth = screenScale(context, 2 / 3).width;
    final double spaceBetween = screenScale(context, 1 / 3).height;
    final double refPadding = screenScale(context, 1 / 10).height;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: refPadding, bottom: refPadding),
        child: Column(
          children: [
            const HeadFrame(),
            SizedBox(height: spaceBetween),
            const AboutFrame(),
            SizedBox(height: spaceBetween),
            Container(
              color: Colors.blue,
              width: referenceWidth,
              height: referenceWidth,
            ),
          ],
        ),
      ),
    );
  }
}
