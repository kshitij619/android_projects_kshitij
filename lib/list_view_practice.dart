import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';

final List<int> numbers = List.generate(
  500,
      (index) => index + 1,
);

class ListViewPractice extends StatelessWidget {
  const ListViewPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.separated (
          itemBuilder: (context, index) {
            final number = numbers[index];
            return buildListItem(number);
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 4,
              height: 4,
              color: Colors.black,
            );
          },
          itemCount: numbers.length,
        ),
      ],
    );
  }

  Container buildListItem (int number) {
    log ('$number built');
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

  Color getRandomColor(){
    return Color(Random().nextInt(0xFFFFFFFF));
  }
}
