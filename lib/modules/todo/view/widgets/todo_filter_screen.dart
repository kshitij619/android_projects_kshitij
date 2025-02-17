import 'package:flutter/material.dart';
import 'package:todo_app/modules/todo/models/todo_category.dart';
import 'package:todo_app/modules/todo/models/todo_priority.dart';
import 'package:todo_app/modules/todo/models/todo_status.dart';

class TodoFilterScreen extends StatelessWidget {
  const TodoFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Screen'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.save_rounded),
        label: const Text('Apply Filter'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Status',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Wrap(
                children: TodoStatus.values.map((e) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: ActionChip(
                      label: Text(e.name),
                      onPressed: () {},
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Text(
                'Priority',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Wrap(
                children: TodoPriority.values.map((e) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: ActionChip(
                      label: Text(e.name),
                      onPressed: () {},
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Text(
                'Category',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Wrap(
                children: TodoCategory.values.map((e) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: ActionChip(
                      label: Text(e.name),
                      onPressed: () {},
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
