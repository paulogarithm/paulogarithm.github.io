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

class AsideContent extends StatefulWidget {
  const AsideContent({super.key});

  @override
  State<AsideContent> createState() => _AsideContentState();
}

class _AsideContentState extends State<AsideContent> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > Constants.widthConstraint;

        return Container(
          width: isWide
              ? (constraints.maxWidth * 0.1).clamp(50, 100)
              : double.infinity,
          color: Colors.transparent,
          child: Align(
            alignment: isWide ? Alignment.bottomCenter : Alignment.centerLeft,
            child: isWide
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: _buildButtons(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _buildButtons(),
                  ),
          ),
        );
      },
    );
  }

  List<Widget> _buildButtons() {
    return [
      _CreateButtonLinkAsset("assets/github-logo.png", Constants.githubLink),
      _CreateButtonLinkAsset("assets/github-logo.png", Constants.linkedinLink),
      _CreateButton(const Icon(Icons.light_mode), () {
        setState(() {
          CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.LIGHT);
        });
      }),
      _CreateButton(const Icon(Icons.dark_mode), () {
        setState(() {
          CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.DARK);
        });
      }),
    ];
  }
}
