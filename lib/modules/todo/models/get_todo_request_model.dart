import 'package:todo_app/modules/todo/models/todo_filter_model.dart';

class GetTodoRequestModel {
  final String query;
  final int limit;
  final int offset;
  final TodoFilterModel filter;

  const GetTodoRequestModel({
    this.query = '',
    this.limit = 20,
    this.offset = 0,
    this.filter = const TodoFilterModel(),
  });

  GetTodoRequestModel copyWith({
    int? limit,
    int? offset,
    String? query,
    TodoFilterModel? filter,
  }) {
    return GetTodoRequestModel(
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      query: query ?? this.query,
      filter: filter ?? this.filter,
    );
  }
}
