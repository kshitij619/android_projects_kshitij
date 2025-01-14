import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';

final List<int> numbers = List.generate(
  500,
  (index) => index + 1,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    double initialValue = 0;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text(
            'Grid View',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
                log('Button pressed');
                initialValue = 0;
                scrollController.animateTo(
                  initialValue,
                  curve: Curves.easeInOut,
                  duration: Duration(seconds: 2),
                );
              },
            ),
            SizedBox(height: 8),
            FloatingActionButton(
              child: const Icon(Icons.arrow_downward),
              onPressed: () {
                log('Button pressed');
                initialValue += 127;
                scrollController.animateTo(
                  initialValue,
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 500),
                );
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Scrollbar(
              interactive: true,
              controller: scrollController,
              thickness: 10,
              radius: Radius.circular(5),
              child: ListView.separated(
                controller: scrollController,
                itemBuilder: (context, index) {
                  final number = numbers[index];
                  return buildListItem(number);
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 2,
                    height: 2,
                    color: Colors.black,
                  );
                },
                itemCount: numbers.length,
              ),
            ),
          ],
        ),
        // body: const GridPractice(),
      ),
    );
  }

  Container buildListItem(int number) {
    log('$number built');
    return Container(
      // padding: const EdgeInsets.all(20),
      height: 125,
      decoration: BoxDecoration(
        color: getRandomColor(),
        // border: Border.all(
        //   width: 2,
        //   color: Colors.black,
        // ),
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 36,
          ),
        ),
      ),
    );
  }

  Color getRandomColor() {
    return Color(Random().nextInt(0xFFFFFFFF));
  }
}
