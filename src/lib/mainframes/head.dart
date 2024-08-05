import 'package:flutter/material.dart';
import '../tools/typewritter.dart';
import '../tools/screen_scale.dart';
import '../constants.dart';

class HeadFrame extends StatefulWidget {
  const HeadFrame({super.key});

  @override
  State<HeadFrame> createState() => _HeadFrameState();
}

class _HeadFrameState extends State<HeadFrame> {
  late TypeWritter tp;

  void _doAfter(TypeWritter tp) async {
    await tp.putWord();
    await Future.delayed(const Duration(seconds: 3));
    await tp.removeWord();
    tp.nextWord();
    _doAfter(tp);
  }

  @override
  void initState() {
    super.initState();
    tp = TypeWritter.fromMultiple(Constants.skillsNames);
    tp.setLetterDelay(100);
    tp.setStateFunc(setState);
    _doAfter(tp);
  }

  @override
  Widget build(BuildContext context) {
    final double refSize = screenScale(context, 2 / 3).width;

    return Container(
      width: refSize,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "Hi ! Welcome to the website of",
              style: TextStyle(
                fontSize: 18.0 + (screenScale(context, .03).width / 10),
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -screenScale(context, .008).width),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Paul Parisot",
                style: TextStyle(
                  fontSize: 68 + (screenScale(context, .1).width / 10),
                ),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text.rich(
              TextSpan(
                text: "A super ",
                style: TextStyle(
                  fontSize: 18.0 + (screenScale(context, .03).width / 10),
                  color: Theme.of(context).hintColor,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: tp.get(),
                    style: TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(text: " developer")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
