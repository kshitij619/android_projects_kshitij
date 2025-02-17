import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/models/todo_model.dart';
import 'package:todo_app/modules/todo/view/create_todo_screen.dart';
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
                icon: Icon(Icons.delete_outline_rounded),
                onPressed: () => _onTapDelete(context),
                tooltip: 'Delete todo',
              ),
              SizedBox(width: 16),
              IconButton(
                onPressed: () => _onTapEdit(context),
                icon: Icon(Icons.edit),
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

  void _onTapDelete(BuildContext context) {
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
  }

  void _onTapEdit(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider.value(
          value: context.read<TodoViewModel>(),
          child: const CreateTodoScreen(),
        ),
      ),
    );
  }
}
