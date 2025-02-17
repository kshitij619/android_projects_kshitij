class TodoFilterModel {
  final List<String> priority;
  final List<String> status;
  final List<String> category;

  const TodoFilterModel({
    this.priority = const [],
    this.status = const [],
    this.category = const [],
  });
}
