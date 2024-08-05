import 'package:flutter/material.dart';
import 'package:roblox_portfolio/themes.dart';
import 'constants.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class _CreateButton extends StatelessWidget {
  final Widget icon;
  final void Function() callback;

  const _CreateButton(this.icon, this.callback);

  @override
  Widget build(BuildContext context) {
    void onPress() => callback();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: SizedBox(
        width: 40,
        child: IconButton(onPressed: onPress, icon: icon),
      ),
    );
  }
}

class _CreateButtonAsset extends _CreateButton {
  final String imagePath;

  _CreateButtonAsset(this.imagePath, callback)
      : super(Image.asset(imagePath), callback);
}

class _CreateButtonLinkAsset extends _CreateButtonAsset {
  final String link;

  _CreateButtonLinkAsset(imagePath, this.link)
      : super(imagePath, () {
          js.context.callMethod('open', [link]);
        });
}

class FixedContent extends StatefulWidget {
  const FixedContent({super.key});

  @override
  State<FixedContent> createState() => _FixedContentState();
}

class _FixedContentState extends State<FixedContent> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double width = (screenWidth * 0.1).clamp(50, 100);

    return Container(
      width: width,
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _CreateButtonLinkAsset(
                "icons/github-logo.png", Constants.githubLink),
            _CreateButtonLinkAsset(
                "icons/github-logo.png", Constants.linkedinLink),
            _CreateButton(const Icon(Icons.dark_mode), () {
              setState(() {
                CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.DARK);
              });
            }),
            _CreateButton(const Icon(Icons.light_mode), () {
              setState(() {
                CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.LIGHT);
              });
            })
          ],
        ),
      ),
    );
  }
}
