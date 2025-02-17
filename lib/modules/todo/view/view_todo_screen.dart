import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/models/todo_model.dart';
import 'package:todo_app/modules/todo/view/dialog/todo_dialog_helper.dart';
import 'package:todo_app/modules/todo/view_models/todo_view_model.dart';

class ViewTodoScreen extends StatelessWidget {
  const ViewTodoScreen({
    super.key,
    required this.model,
  });

  final TodoModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Todo'),
            actions: [
              IconButton(
                padding: EdgeInsets.only(right: 16),
                icon: Icon(Icons.delete),
                onPressed: () {
                  TodoDialogHelper.showDeleteConfirmationDialog(
                    context,
                    () {
                      context.read<TodoViewModel>().deleteTodoEvent(
                            todo: model,
                            onCompleted: () {
                              Navigator.of(context).pop();
                            },
                          );
                    },
                  );
                },
                tooltip: 'Delete todo',
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 16,
                ),
                if (model.description != null)
                  Text(
                    model.description!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
              ],
            ),
          ),
        ),
        // const CreateTodoLoaderOverlay(),
      ],
    );
  }
}
