import 'package:flutter/material.dart';
import 'maincontent.dart';
import 'asidecontent.dart';
import "themes.dart";

void main() {
  runApp(const CustomTheme(
    initialThemeKey: MyThemeKeys.DARK,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.of(context),
      home: const AppContent(),
    );
  }
}

class AppContent extends StatelessWidget {
  const AppContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: <Widget>[
          FixedContent(),
          Expanded(
            child: MainContent(),
          ),
        ],
      ),
    );
  }
}
