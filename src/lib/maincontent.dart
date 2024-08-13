import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'tools/screen_scale.dart';
import 'constants.dart';
import 'mainframes/experiences.dart';
import 'mainframes/head.dart';
import 'mainframes/about.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  final Map<int, bool> _visibleItems = {};

  void _onVisibilityChanged(VisibilityInfo info, int index) {
    if (info.visibleFraction > 0.1) {
      setState(() {
        _visibleItems[index] = true;
      });
    }
  }

  Widget _createAnimation(Widget child, int index) {
    final isVisible = _visibleItems.containsKey(index);
    const int durationMs = Constants.appearTimeMs;

    return VisibilityDetector(
      key: Key("item-$index"),
      onVisibilityChanged: (info) => _onVisibilityChanged(info, index),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: durationMs),
        opacity: isVisible ? 1.0 : 0.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: durationMs),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(
              0, (isVisible ? 0 : (durationMs / 10)), 0),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double referenceWidth = screenScale(context, 2 / 3).width;
    final double spaceBetween = screenScale(context, 1 / 4).height;
    final double refPadding = screenScale(context, 1 / 6).height;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: refPadding, bottom: refPadding),
        child: Column(
          children: [
            const HeadFrame(),
            SizedBox(height: spaceBetween),
            _createAnimation(const AboutFrame(), 1),
            SizedBox(height: spaceBetween),
            _createAnimation(const ExperienceFrame(), 2),
            SizedBox(height: spaceBetween),
            // TODO: Projects
            _createAnimation(
                Container(
                  color: Colors.red,
                  width: referenceWidth,
                  height: referenceWidth,
                ),
                3),
            SizedBox(height: spaceBetween),
            // TODO: Fun facts
            _createAnimation(
                Container(
                  color: Colors.green,
                  width: referenceWidth,
                  height: referenceWidth,
                ),
                4),
          ],
        ),
      ),
    );
  }
}
