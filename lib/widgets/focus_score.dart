import 'package:flutter/material.dart';
import 'package:two_screen_application/models/build_icon.dart';

class FocusScore extends StatelessWidget {
  const FocusScore({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BuildIcon> icons = [
      const BuildIcon(iconUrl: 'images/instagramIcon.png', position: 0),
      const BuildIcon(iconUrl: 'images/whatsappIcon.png', position: 32),
      const BuildIcon(iconUrl: 'images/twitterIcon.png', position: 64),
      const BuildIcon(iconUrl: 'images/facebookIcon.png', position: 96),
      const BuildIcon(iconUrl: 'images/youtubeIcon.png', position: 128),
      const BuildIcon(iconUrl: 'images/snapchatIcon.png', position: 160),
    ];
    return Container(
      width: 412,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xFFFCE1AB),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('FOCUS SCORE'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '8.5',
                        style: TextStyle(),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    height: 48,
                    child: Stack(
                      children: icons.map((icon) => icon.buildIcon()).toList(),
                    ),
                  ),
                  const Text('Most used'),
                ],
              )
            ],
          ),
          const Row(),
        ],
      ),
    );
  }
}
