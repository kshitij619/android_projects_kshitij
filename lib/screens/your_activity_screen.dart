import 'package:flutter/material.dart';
import 'package:two_screen_application/widgets/focus_score.dart';
import 'package:two_screen_application/widgets/profile_bar.dart';
import 'package:two_screen_application/widgets/screen_time_box.dart';

class YourActivityScreen extends StatelessWidget {
  const YourActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 890,
              width: 412,
              color: const Color(0xFFE4E2D2),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              child: const ProfileBar(),
            ),
            const Positioned(
              top: 140,
              child: ScreenTimeBox(),
            ),
            const Positioned(
              top: 550,
              child: FocusScore(),
            ),
          ],
        ),
      ),
    );
  }
}
