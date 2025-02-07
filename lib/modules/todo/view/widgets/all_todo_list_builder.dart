import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/view_models/todo_view_model.dart';

class AllTodoListBuilder extends StatefulWidget {
  const AllTodoListBuilder({super.key});

  @override
  State<AllTodoListBuilder> createState() => _AllTodoListBuilderState();
}

class _AllTodoListBuilderState extends State<AllTodoListBuilder> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) context.read<TodoViewModel>().fetchAllTodosEvent();
    });
  }

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoViewModel>().todos;
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          title: Text(
            todo.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        );
      },
    );
  }
}


// TODO: Start at 32:20