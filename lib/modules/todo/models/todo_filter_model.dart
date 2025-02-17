import 'package:todo_app/modules/todo/models/todo_category.dart';
import 'package:todo_app/modules/todo/models/todo_priority.dart';
import 'package:todo_app/modules/todo/models/todo_status.dart';

class TodoFilterModel {
  final List<TodoPriority> priority;
  final List<TodoStatus> status;
  final List<TodoCategory> category;

  const TodoFilterModel({
    this.priority = const [],
    this.status = const [],
    this.category = const [],
  });

  TodoFilterModel copyWith({
    List<TodoPriority>? priority,
    List<TodoStatus>? status,
    List<TodoCategory>? category,
  }) {
    return TodoFilterModel(
      priority: priority ?? this.priority,
      status: status ?? this.status,
      category: category ?? this.category,
    );
  }
}
