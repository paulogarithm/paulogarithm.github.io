import 'dart:js_interop';
import 'package:flutter/material.dart';

enum MyThemeKeys { LIGHT, DARK }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: "Google",
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(
      color: Color(0xff171d49),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Colors.grey,
      cursorColor: Color(0xff171d49),
      selectionHandleColor: Color(0xff005e91),
    ),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    highlightColor: Colors.black,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
        focusColor: Colors.blueAccent,
        splashColor: Colors.lightBlue),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: "Google",
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 118, 189, 255),
    highlightColor: Colors.white,
    scaffoldBackgroundColor: const Color.fromARGB(255, 7, 9, 16),
    textSelectionTheme:
        const TextSelectionThemeData(selectionColor: Colors.grey),
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) =>
      (themeKey == MyThemeKeys.LIGHT) ? lightTheme : darkTheme;
}

class _CustomTheme extends InheritedWidget {
  final CustomThemeState data;

  const _CustomTheme({
    required this.data,
    required super.child,
  });

  @override
  bool updateShouldNotify(_CustomTheme oldWidget) {
    return true;
  }
}

class CustomTheme extends StatefulWidget {
  final Widget child;
  final MyThemeKeys initialThemeKey;

  const CustomTheme({
    super.key,
    required this.initialThemeKey,
    required this.child,
  });

  @override
  CustomThemeState createState() => CustomThemeState();

  static ThemeData of(BuildContext context) {
    _CustomTheme? inherited =
        (context.dependOnInheritedWidgetOfExactType<_CustomTheme>());

    if (inherited == null) {
      throw NullRejectionException(true);
    }
    return inherited.data.theme;
  }

  static CustomThemeState instanceOf(BuildContext context) {
    _CustomTheme? inherited =
        (context.dependOnInheritedWidgetOfExactType<_CustomTheme>());

    if (inherited == null) {
      throw NullRejectionException(true);
    }
    return inherited.data;
  }
}

class CustomThemeState extends State<CustomTheme> {
  late ThemeData _theme;
  ThemeData get theme => _theme;

  @override
  void initState() {
    _theme = MyThemes.getThemeFromKey(widget.initialThemeKey);
    super.initState();
  }

  void changeTheme(MyThemeKeys themeKey) {
    setState(() {
      _theme = MyThemes.getThemeFromKey(themeKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _CustomTheme(
      data: this,
      child: widget.child,
    );
  }
}
