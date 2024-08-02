import 'package:flutter/material.dart';
import 'constants.dart';
import 'dart:js' as js;

class _CreateButton extends StatelessWidget {
  const _CreateButton(this.imagePath, this.link);

  final String imagePath;
  final String link;

  @override
  Widget build(BuildContext context) {
    void onPress() {
      js.context.callMethod('open', [LINKS.GITHUB]);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: SizedBox(
        width: 40,
        child: IconButton(
            onPressed: onPress, icon: Image.asset("assets/github-logo.png")),
      ),
    );
  }
}

class FixedContent extends StatelessWidget {
  const FixedContent({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double width = (screenWidth * 0.1).clamp(50, 100);

    return Container(
      width: width,
      color: Colors.blue,
      child: const Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _CreateButton("assets/github-logo.png", LINKS.GITHUB),
            _CreateButton("assets/github-logo.png", LINKS.GITHUB),
            _CreateButton("assets/github-logo.png", LINKS.GITHUB)
          ],
        ),
      ),
    );
  }
}
