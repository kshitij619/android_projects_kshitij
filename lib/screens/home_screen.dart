import 'package:flutter/material.dart';
import 'package:two_screen_application/models/home_screen_text.dart';
import 'package:two_screen_application/widgets/get_started_widget.dart';
import 'package:two_screen_application/widgets/home_screen_widget.dart';

List<HomeScreenText> textList = [
  const HomeScreenText(mainText: 'Goal-setting'),
  const HomeScreenText(mainText: 'Dedication'),
  const HomeScreenText(mainText: 'Workflow'),
  const HomeScreenText(mainText: 'Efficiency'),
  const HomeScreenText(mainText: 'Concentration'),
  const HomeScreenText(mainText: 'Discipline'),
  const HomeScreenText(mainText: 'Balance'),
  const HomeScreenText(mainText: 'Productivity'),
  const HomeScreenText(mainText: 'Time-management'),
  const HomeScreenText(mainText: 'Performance'),
  const HomeScreenText(mainText: 'Focus.', opacity: 1),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(249, 255, 99, 99),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 55,
                ),
                for (final homeScreenText in textList)
                  HomeScreenWidget(homeScreenText: homeScreenText),
              ],
            ),
            const Positioned(
              right: 80,
              bottom: -10,
              child: Image(
                image: AssetImage('images/star.png'),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 220,
              child: HomeScreenWidget(homeScreenText: textList[10]),
            ),
            const Positioned(
              child: GetStartedWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
