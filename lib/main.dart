import 'package:flutter/material.dart';
import 'package:local_database/application.dart';
import 'package:local_database/database/local_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ? VERY VERY IMPORTANT LINE
  await LocalDatabase.instance.createDatabase();

  runApp(
    const Application(),
  );
}
