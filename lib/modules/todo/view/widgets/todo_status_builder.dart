import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/models/todo_status.dart';
import 'package:todo_app/modules/todo/view_models/todo_view_model.dart';

class TodoStatusBuilder extends StatelessWidget {
  const TodoStatusBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedStatus = context.watch<TodoViewModel>().status;
    return Row(
      children: [
        Text(
          'Status',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        ...TodoStatus.values.map((status) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InputChip(
              selected: selectedStatus == status,
              label: Text(
                status.name,
              ),
              onSelected: (value) {
                _onSelectedEvent(value, context, status);
              },
            ),
          );
        }),
      ],
    );
  }

  void _onSelectedEvent(
    bool value,
    BuildContext context,
    TodoStatus status,
  ) {
    if (value) {
      context.read<TodoViewModel>().changeTodoStatusEvent(status);
    }
  }
}
