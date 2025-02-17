import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/view_models/todo_view_model.dart';

class TodoSearchTextField extends StatelessWidget {
  const TodoSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        onChanged: (text) {
          context.read<TodoViewModel>().searchQueryChangedEvent(text);
        },
        decoration: InputDecoration(
          hintText: 'Search by title',
          prefixIcon: Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }
}
