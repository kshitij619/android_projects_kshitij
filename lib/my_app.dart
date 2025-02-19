import 'package:firebase_demo/auth_service.dart';
import 'package:firebase_demo/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: MaterialApp(
        home: const AuthWrapper(),
      ),
    );
  }
}
