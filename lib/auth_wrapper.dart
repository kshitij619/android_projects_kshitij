import 'package:firebase_demo/auth_service.dart';
import 'package:firebase_demo/home_screen.dart';
import 'package:firebase_demo/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    if (authService.user != null) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}
