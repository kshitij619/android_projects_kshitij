import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_assignment/profile_app.dart';
import 'package:shared_preferences_assignment/profile_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProfileViewModel(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        ),
        home: const ProfileApp(),
      ),
    ),
  );
}
