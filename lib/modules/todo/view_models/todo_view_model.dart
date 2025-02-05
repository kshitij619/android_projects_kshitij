import 'package:flutter/material.dart';
import 'package:todo_app/modules/todo/models/todo_category.dart';
import 'package:todo_app/modules/todo/models/todo_model.dart';
import 'package:todo_app/modules/todo/models/todo_priority.dart';
import 'package:todo_app/modules/todo/models/todo_status.dart';
import 'package:todo_app/modules/todo/service/todo_local_database_service.dart';

class TodoViewModel extends ChangeNotifier {
  TodoCategory category = TodoCategory.personal;
  TodoPriority priority = TodoPriority.medium;
  TodoStatus status = TodoStatus.pending;

  final service = TodoLocalDatabaseService();

  void changeTodoCategoryEvent(TodoCategory category) {
    this.category = category;
    notifyListeners();
  }

  void changeTodoPriorityEvent(TodoPriority priority) {
    this.priority = priority;
    notifyListeners();
  }

  void changeTodoStatusEvent(TodoStatus status) {
    this.status = status;
    notifyListeners();
  }

  void createTodoEvent({
    required String title,
    String? description,
  }) {
    final model = TodoModel(
      title: title,
      category: category,
      priority: priority,
      status: status,
      createdAt: DateTime.now(),
    );
    service.createTodo(model);
  }
}
