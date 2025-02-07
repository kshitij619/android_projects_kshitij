import 'dart:developer';

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

  List<TodoModel> todos = [];

  bool isLoading = false;

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
    required Function(TodoModel? result) onCompleted,
  }) async {
    final model = TodoModel(
      title: title,
      category: category,
      priority: priority,
      status: status,
      createdAt: DateTime.now(),
    );
    isLoading = true;
    notifyListeners();
    final result = await service.createTodo(model);
    onCompleted.call(result);
    isLoading = false;
    notifyListeners();
  }

  void fetchAllTodosEvent() async {
    isLoading = true;
    notifyListeners();
    final result = await service.getAllTodos();
    log(result?.length.toString() ?? 'Error');
    todos = result ?? [];
    isLoading = false;
    notifyListeners();
  }
}

// TODO: Start at 26:00
