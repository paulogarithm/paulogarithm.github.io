// This is the widget for the about me frame.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../tools/screen_scale.dart';
import '../constants.dart';

TextStyle _getTitleParams(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).primaryColor,
    fontSize: 40.0 + (screenScale(context, .03).width / 10),
  );
}

TextStyle _getNormalParams(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).highlightColor,
    fontSize: 20.0 + (screenScale(context, .03).width / 10),
  );
}

class AboutFrame extends StatefulWidget {
  const AboutFrame({super.key});

  @override
  State<AboutFrame> createState() => _AboutFrameState();
}

class _AboutFrameState extends State<AboutFrame> {
  late Future<String> _fileContentFuture;

  Future<String> _loadFileContent(String path) async {
    String content = await rootBundle.loadString(path);

    final Map<String, String> variables = {
      "AGE": (() {
        DateTime now = DateTime.now();
        int age = now.year - Constants.myBirthday.year;

        if ((now.month < Constants.myBirthday.month) ||
            (now.month == Constants.myBirthday.month &&
                now.day < Constants.myBirthday.day)) {
          age--;
        }
        return age.toString();
      })()
    };

    variables.forEach((k, v) {
      content = content.replaceAll("\$$k", v);
    });

    return content;
  }

  @override
  void initState() {
    super.initState();
    _fileContentFuture = _loadFileContent(Constants.aboutMePath);
  }

  @override
  Widget build(BuildContext context) {
    final double refWidth = screenScale(context, 2 / 3).width;

    return Container(
      color: Colors.transparent,
      width: refWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("About me", style: _getTitleParams(context)),
          FutureBuilder<String>(
            future: _fileContentFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text(
                  "...",
                  style: _getNormalParams(context),
                );
              } else {
                return Text(
                  snapshot.data ?? '...',
                  style: _getNormalParams(context),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}