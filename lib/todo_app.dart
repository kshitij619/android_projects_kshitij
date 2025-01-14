import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TodoApp(),
  ));
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});
  @override
  State<StatefulWidget> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<String> todoItems = [];
  final textController = TextEditingController();

  void _addTodoItem(String task) {
    setState(() {
      todoItems.add(task);
    });
    textController.clear();
  }

  void _removeTodoItem(int index) {
    setState(() {
      todoItems.removeAt(index);
    });
  }

  void showAddTodoDialogue() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add your task'),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: 'Enter your task...'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                textController.clear();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _addTodoItem(textController.text);
                Navigator.pop(context);
              },
              child: const Text('Enter'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTodoItem(String todoText, int index) {
    return ListTile(
      title: Text(todoText),
      trailing: IconButton(
        onPressed: () => _removeTodoItem(index),
        icon: Icon(Icons.delete),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: todoItems.isEmpty
          ? const Text('No tasks pending')
          : ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          return _buildTodoItem(todoItems[index], index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddTodoDialogue,
        tooltip: 'Add a task',
        child: Icon(Icons.add),
      ),
    );
  }
}
