import 'package:flutter/material.dart';
import 'tools/screen_scale.dart';

TextStyle getTitleParams(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).primaryColor,
    fontSize: 30.0 + (screenScale(context, .03).width / 5),
  );
}

TextStyle getBigTextParams(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).highlightColor,
    fontSize: 15.0 + (screenScale(context, .03).width / 5),
  );
}

TextStyle getLittleTitleParams(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).primaryColor,
    fontSize: 15.0 + (screenScale(context, .03).width / 5),
    fontWeight: FontWeight.bold
  );
}