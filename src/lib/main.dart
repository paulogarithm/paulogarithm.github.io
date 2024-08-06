import 'package:flutter/material.dart';
import 'maincontent.dart';
import 'asidecontent.dart';
import 'themes.dart';
import 'constants.dart';

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
      title: "Portfolio - Paul PARISOT",
      theme: CustomTheme.of(context),
      home: const AppContent(),
    );
  }
}

class AppContent extends StatelessWidget {
  const AppContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > Constants.widthConstraint) {
            // Tablet/Desktop layout
            return const Row(
              children: <Widget>[
                AsideContent(),
                Expanded(child: MainContent()),
              ],
            );
          } else {
            // Mobile layout
            return const Column(
              children: <Widget>[
                AsideContent(),
                Expanded(child: MainContent()),
              ],
            );
          }
        },
      ),
    );
  }
}
