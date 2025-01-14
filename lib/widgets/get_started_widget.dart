import 'package:flutter/material.dart';

class GetStartedWidget extends StatelessWidget {
  const GetStartedWidget({super.key});
  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
      child: Container(
        alignment: Alignment.bottomCenter,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            color: const Color.fromARGB(249, 255, 99, 99),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 130, vertical: 25),
            child: Text(
              'Get Started ',
              style: TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
