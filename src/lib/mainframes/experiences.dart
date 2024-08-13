import 'package:flutter/material.dart';
import '../params.dart';
import '../tools/screen_scale.dart';

class ExperienceFrame extends StatefulWidget {
  const ExperienceFrame({super.key});

  @override
  State<ExperienceFrame> createState() => _ExperienceState();
}

class _ExperienceState extends State<ExperienceFrame> {
  late double _ballWidth;

  Widget _buildYappingContainer(String title, String yap) {
    return Container(
      color: const Color.fromARGB(115, 214, 30, 255),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: getLittleTitleParams(context),
          ),
          Text(yap)
        ],
      ),
    );
  }

  Widget _buildExperience(String title, String yap) {
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(115, 255, 154, 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: _ballWidth,
                height: _ballWidth,
                decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              _buildYappingContainer(title, yap)
            ],
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double referenceWidth = screenScale(context, 2 / 3).width;
    const double lineSize = 6; // referenceWidth / 200;
    final double bigSize = 2 * referenceWidth;

    _ballWidth = (screenScale(context, 1 / 100).width).clamp(15, 20);
    return Container(
        color: Colors.transparent,
        width: referenceWidth,
        height: bigSize,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Experiences", style: getTitleParams(context)),
            const SizedBox(height: 50),
            SizedBox(
              height: bigSize / 2,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: _ballWidth / 2 - lineSize / 2,
                    top: 0,
                    child: Container(
                      // this is the line
                      width: lineSize,
                      height: referenceWidth,
                      decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      _buildExperience("Faurecia Clarion Electronics",
                          "My goal was to develop appications"),
                      _buildExperience("Others", "yap again"),
                      _buildExperience("DADDAAA", "yap again"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
