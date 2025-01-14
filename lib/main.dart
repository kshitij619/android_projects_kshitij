import 'package:api_call_demo/home_screen.dart';
import 'package:api_call_demo/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Call Demo',
      home: HomeScreen(),
    ),
  ));
}
