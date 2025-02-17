import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/models/todo_category.dart';
import 'package:todo_app/modules/todo/view_models/todo_view_model.dart';

class TodoCategoryBuilder extends StatelessWidget {
  const TodoCategoryBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCategory = context.watch<TodoViewModel>().category;
    return Row(
      children: [
        Text(
          'Category',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Spacer(),
        ...TodoCategory.values.map((category) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InputChip(
              selected: selectedCategory == category,
              label: Text(
                category.name,
              ),
              onSelected: (value) {
                _onSelectedEvent(value, context, category);
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
    TodoCategory category,
  ) {
    if (value) {
      context.read<TodoViewModel>().changeTodoCategoryEvent(category);
    }
  }
}
