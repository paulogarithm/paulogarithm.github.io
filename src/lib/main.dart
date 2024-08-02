import 'package:flutter/material.dart';
import 'maincontent.dart';
import 'fixedcontent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Portfolio",
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF030607)),
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
