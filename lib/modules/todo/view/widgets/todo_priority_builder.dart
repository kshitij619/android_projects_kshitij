import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/models/todo_priority.dart';
import 'package:todo_app/modules/todo/view_models/todo_view_model.dart';

class TodoPriorityBuilder extends StatelessWidget {
  const TodoPriorityBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPriority = context.watch<TodoViewModel>().priority;
    return Row(
      children: [
        Text(
          'Priority',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        ...TodoPriority.values.map((priority) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InputChip(
              selected: selectedPriority == priority,
              label: Text(
                priority.name,
              ),
              onSelected: (value) {
                _onSelectedEvent(value, context, priority);
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
    TodoPriority priority,
  ) {
    if (value) {
      context.read<TodoViewModel>().changeTodoPriorityEvent(priority);
    }
  }
}
