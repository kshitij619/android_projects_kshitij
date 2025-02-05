import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/view/create_todo_screen.dart';
import 'package:todo_app/modules/todo/view_models/todo_view_model.dart';

class AllTodoScreen extends StatelessWidget {
  const AllTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Todos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Create'),
        onPressed: () {
          _navigateToCreateTodoScreen(context);
        },
        icon: Icon(Icons.add),
      ),
      body: Container(),
    );
  }

  void _navigateToCreateTodoScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (newContext) => ChangeNotifierProvider.value(
          value: context.read<TodoViewModel>(),
          child: const CreateTodoScreen(),
        ),
      ),
    );
  }
}
