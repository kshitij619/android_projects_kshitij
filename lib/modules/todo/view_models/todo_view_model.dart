import 'package:flutter/material.dart';
import 'package:todo_app/modules/todo/models/get_todo_request_model.dart';
import 'package:todo_app/modules/todo/models/todo_category.dart';
import 'package:todo_app/modules/todo/models/todo_filter_model.dart';
import 'package:todo_app/modules/todo/models/todo_model.dart';
import 'package:todo_app/modules/todo/models/todo_priority.dart';
import 'package:todo_app/modules/todo/models/todo_status.dart';
import 'package:todo_app/modules/todo/service/todo_local_database_service.dart';

class TodoViewModel extends ChangeNotifier {
  TodoCategory category = TodoCategory.personal;
  TodoPriority priority = TodoPriority.medium;
  TodoStatus status = TodoStatus.pending;

  bool isLoading = false;
  bool isLoadingMore = false;

  GetTodoRequestModel request = const GetTodoRequestModel(
    filter: TodoFilterModel(
      priority: [],
      category: [],
      status: [],
    ),
  );
  int limit = 15;

  List<TodoModel> todos = [];

  int total = 0;

  final service = TodoLocalDatabaseService();

  int get totalFilters =>
      request.filter.priority.length +
      request.filter.category.length +
      request.filter.status.length;

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
      description: description,
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
    fetchAllTodosEvent();
  }

  void fetchAllTodosEvent() async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
    final result = await service.getAllTodos(request);
    todos = result?.todos ?? [];
    total = result?.total ?? 0;
    isLoading = false;
    notifyListeners();
  }

  void fetchMoreTodos() async {
    if (isLoadingMore) return;
    if (todos.length >= total) return;
    isLoadingMore = true;
    notifyListeners();
    request = request.copyWith(
      offset: todos.length,
    );
    final result = await service.getAllTodos(request);
    todos = [...todos, ...result?.todos ?? []];
    total = result?.total ?? 0;
    isLoadingMore = false;
    notifyListeners();
  }

  void deleteTodoEvent({
    required TodoModel todo,
    required VoidCallback onCompleted,
  }) async {
    if (todo.id == null) return;
    isLoading = true;
    notifyListeners();
    await service.deleteTodo(todo.id!);
    isLoading = false;
    _removeTodoFromList(todo);
    onCompleted.call();
    notifyListeners();
  }

  void _removeTodoFromList(TodoModel todo) {
    todos.remove(todo);
    total--;
    notifyListeners();
  }

  void markCompletedEvent(TodoModel model) {}

  void searchQueryChangedEvent(String text) {
    request = request.copyWith(
      query: text.trim(),
    );
    fetchAllTodosEvent();
  }

  void selectStatusFilterEvent(TodoStatus status) {
    if (request.filter.status.contains(status)) {
      request.filter.status.remove(status);

      request = request.copyWith(
        filter: request.filter.copyWith(
          status: [...request.filter.status..remove(status)],
        ),
      );
      notifyListeners();
    } else {
      request = request.copyWith(
        filter: request.filter.copyWith(
          status: [...request.filter.status, status],
        ),
      );
      notifyListeners();
    }
  }

  void selectPriorityFilterEvent(TodoPriority priority) {
    if (request.filter.priority.contains(priority)) {
      request.filter.priority.remove(priority);

      request = request.copyWith(
        filter: request.filter.copyWith(
          priority: [...request.filter.priority..remove(priority)],
        ),
      );
      notifyListeners();
    } else {
      request = request.copyWith(
        filter: request.filter.copyWith(
          priority: [...request.filter.priority, priority],
        ),
      );
      notifyListeners();
    }
  }

  void selectCategoryFilterEvent(TodoCategory category) {
    if (request.filter.category.contains(category)) {
      request.filter.category.remove(category);

      request = request.copyWith(
        filter: request.filter.copyWith(
          category: [...request.filter.category..remove(category)],
        ),
      );
      notifyListeners();
    } else {
      request = request.copyWith(
        filter: request.filter.copyWith(
          category: [...request.filter.category, category],
        ),
      );
      notifyListeners();
    }
  }

  void applyFilterEvent() {
    fetchAllTodosEvent();
  }
}
