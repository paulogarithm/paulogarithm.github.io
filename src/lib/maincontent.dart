// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'typewritter.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

Size screenScale(BuildContext context, double scale) =>
    MediaQuery.of(context).size * scale;

class _MainContentState extends State<MainContent> {
  late TypeWritter tp;

  void _doAfter(TypeWritter tp) async {
    await tp.putWord();
    await Future.delayed(const Duration(seconds: 3));
    print("Bar");
    await tp.removeWord();
    print("Foo");
    tp.nextWord();
    _doAfter(tp);
  }

  @override
  void initState() {
    super.initState();
    tp = TypeWritter.fromMultiple(["Flutter", "C", "C++", "Lua", "Python"]);
    tp.setLetterDelay(100);
    tp.setStateFunc(setState);
    _doAfter(tp);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 128.0,
        left: screenScale(context, .18).width,
        right: screenScale(context, .18).width,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text.rich(
          TextSpan(
            text: "A super ",
            style: TextStyle(
                fontSize: screenScale(context, .045).width.clamp(10, 70)),
            children: <TextSpan>[
              TextSpan(
                  text: tp.get(), style: const TextStyle(color: Colors.red)),
              const TextSpan(text: " developer")
            ],
          ),
        ),
      ),
    );
  }
}
