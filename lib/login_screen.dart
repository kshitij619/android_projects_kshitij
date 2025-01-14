import 'package:flutter/material.dart';
import 'package:state_management_practice/counter_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const MeraNayaTextWidget(),
            const IncrementButton(),
            const DecrementButton(),
          ],
        ),
      ),
    );
  }
}
