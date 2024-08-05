import 'package:flutter/material.dart';
import '../tools/typewritter.dart';
import '../tools/screen_scale.dart';

class HeadFrame extends StatefulWidget {
  const HeadFrame({super.key});

  @override
  State<HeadFrame> createState() => _HeadFrameCrappy();
}

class _HeadFrameCrappy extends State<HeadFrame> {
  @override
  Widget build(BuildContext context) {
    final double refSize = screenScale(context, 2/3).width;

    return Container(
      width: refSize,
      height: refSize,
      color: Colors.red,
    );
  }
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
              fontSize: screenScale(context, .045).width.clamp(10, 70),
            ),
            children: <TextSpan>[
              TextSpan(
                text: tp.get(),
                style: const TextStyle(color: Colors.red),
              ),
              const TextSpan(text: " developer")
            ],
          ),
        ),
      ),
    );
  }
}
