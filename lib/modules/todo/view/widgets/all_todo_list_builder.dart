import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/models/todo_priority.dart';
import 'package:todo_app/modules/todo/view/view_todo_screen.dart';
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
    final isLoadingMore = context.read<TodoViewModel>().isLoadingMore;

    return Column(
      children: [
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels ==
                  notification.metrics.maxScrollExtent) {
                log('reached the end!');
                context.read<TodoViewModel>().fetchMoreTodos();
              }
              return false;
            },
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                );
              },
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                // log('builder called at index $index');
                return ListTile(
                  leading: Icon(
                    Icons.circle,
                    color: _getColor(todo.priority),
                  ),
                  title: Text(
                    todo.title.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: (todo.description != null)
                      ? Text(
                          todo.description!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        )
                      : null,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider.value(
                          value: context.read<TodoViewModel>(),
                          child: ViewTodoScreen(model: todo),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        if (isLoadingMore)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}

Color _getColor(TodoPriority priority) {
  switch (priority) {
    case TodoPriority.low:
      return Colors.greenAccent;
    case TodoPriority.medium:
      return Colors.yellow;
    case TodoPriority.high:
      return Colors.red;
  }
}
