import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppContent(),
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

class FixedContent extends StatelessWidget {
  const FixedContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width using MediaQuery
    final double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the width as 20% of the screen width
    final double width = screenWidth * 0.2;

    return Container(
      width: width,
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Fixed',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Hello world !"),
    );
  }
}

