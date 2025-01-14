import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';

final List<int> numbers = List.generate(
  500,
  (index) => index + 1,
);

class GridPractice extends StatelessWidget {
  const GridPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            // mainAxisExtent: 20, // max size of each grid
            // childAspectRatio: 4/3,
          ),
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            final number = numbers[index];
            return buildListItem(number);
          },
          // children:
          //   numbers.map((e) => buildListItem(e)).toList(),
        ),
        
        // ListView.builder(
        //   itemCount: numbers.length,
        //   itemBuilder: (context, index){
        //     final number = numbers[index];
        //     log ('$number built');
        //     return buildListItem(number);
        //   }
        // ),
      ],
    );
  }

  Widget buildListView(){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: numbers.length,
      itemBuilder: (context, index){
        final number = numbers[index];
        log ('$number built');
        return buildListItem(number);
      }
    );
  }

  Container buildListItem (int number) {
    log ('$number built');
    return Container(
      // padding: const EdgeInsets.all(2),
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
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  Color getRandomColor(){
    return Color(Random().nextInt(0xFFFFFFFF));
  }
}
