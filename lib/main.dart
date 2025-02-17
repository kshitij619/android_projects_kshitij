import 'package:flutter/material.dart';
import 'package:todo_app/application.dart';
import 'package:todo_app/core/database/local_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.instance.createDatabase();

  runApp(const Application());
}

// TODO: Start at 01:20:40
