import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/todo_provider.dart';
import 'package:simple_todo_app/todo_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: const MyTodoApp(),
    ),
  );
}

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}
