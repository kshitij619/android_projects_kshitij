import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/todo_provider.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Column(
        children: [
          addTodoTextField(todoProvider),
          Expanded(
            child: todoProvider.todos.isEmpty
                ? const Text('No tasks added yet!')
                : ListView.builder(
                    itemCount: todoProvider.todos.length,
                    itemBuilder: (context, index) {
                      final todo = todoProvider.todos[index];
                      return ListTile(
                        leading: Checkbox(
                          value: todo.isCompleted,
                          onChanged: (value) {
                            todoProvider.toggleTodoStatus(todo.id);
                          },
                        ),
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration: todo.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            todoProvider.deleteTodo(todo.id);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Padding addTodoTextField(TodoProvider todoProvider) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Add a new task',
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              final title = _controller.text.trim();
              if (title.isNotEmpty) {
                todoProvider.addTodo(title);
                _controller.clear();
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
