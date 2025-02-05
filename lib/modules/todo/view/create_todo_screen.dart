import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/view/widgets/todo_category_builder.dart';
import 'package:todo_app/modules/todo/view/widgets/todo_priority_builder.dart';
import 'package:todo_app/modules/todo/view/widgets/todo_status_builder.dart';
import 'package:todo_app/modules/todo/view_models/todo_view_model.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create todos'),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(hintText: 'Enter title'),
                  validator: (input) {
                    if (input == null) return 'Enter title';
                    if (input.trim().isEmpty) return 'Title is required';
                    if (input.trim().length <= 5) {
                      return 'Minimum 5 characters required';
                    }
                    return null;
                  },
                  maxLength: 100,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(hintText: 'Enter description'),
                  maxLines: 5,
                  maxLength: 500,
                ),
                const SizedBox(height: 20),
                const TodoCategoryBuilder(),
                const SizedBox(height: 20),
                const TodoPriorityBuilder(),
                const SizedBox(height: 20),
                const TodoStatusBuilder(),
                SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      context.read<TodoViewModel>().createTodoEvent(
                          title: titleController.text,
                          description: descriptionController.text);
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
