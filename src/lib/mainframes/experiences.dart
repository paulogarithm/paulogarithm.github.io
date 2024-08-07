import 'package:flutter/material.dart';
import '../tools/screen_scale.dart';

class ExperienceFrame extends StatefulWidget {
  const ExperienceFrame({super.key});

  @override
  State<ExperienceFrame> createState() => _ExperienceState();
}

class _ExperienceState extends State<ExperienceFrame> {
  @override
  Widget build(BuildContext context) {
    final double referenceWidth = screenScale(context, 2 / 3).width;
    final double ballWidth = screenScale(context, 1 / 100).width;
    final double lineSize = referenceWidth / 200;

    return Container(
      color: Colors.transparent,
      width: referenceWidth,
      height: referenceWidth,
      child: Stack(
        children: [
          Positioned(
            left: ballWidth / 2 - lineSize / 2,
            child: Container(
              width: lineSize,
              height: referenceWidth,
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: ballWidth,
                    height: ballWidth,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: ballWidth,
                    height: ballWidth,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
