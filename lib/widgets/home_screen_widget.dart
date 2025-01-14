import 'package:flutter/material.dart';
import 'package:two_screen_application/models/home_screen_text.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({
    super.key,
    required this.homeScreenText,
  });

  final HomeScreenText homeScreenText;

  @override
  Widget build(Object context) {
    return Opacity(
      opacity: homeScreenText.opacity,
      child: Text(
        homeScreenText.mainText,
        softWrap: false,
        style: TextStyle(
          fontFamily: homeScreenText.fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: homeScreenText.fontSize,
          height: 0.9,
          letterSpacing: -2,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}
