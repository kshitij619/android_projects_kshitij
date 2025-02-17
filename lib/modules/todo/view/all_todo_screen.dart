import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/view/create_todo_screen.dart';
import 'package:todo_app/modules/todo/view/widgets/all_todo_list_builder.dart';
import 'package:todo_app/modules/todo/view/todo_filter_screen.dart';
import 'package:todo_app/modules/todo/view/widgets/todo_search_text_field.dart';
import 'package:todo_app/modules/todo/view_models/todo_view_model.dart';

class AllTodoScreen extends StatelessWidget {
  const AllTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final total = context.watch<TodoViewModel>().total;
    final totalFilters = context.watch<TodoViewModel>().totalFilters;
    return Scaffold(
      appBar: AppBar(
        title: Text('All Todos (${total.toString()})'),
        actions: [
          Badge(
            label: Text(totalFilters.toString()),
            isLabelVisible: totalFilters > 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider.value(
                      value: context.read<TodoViewModel>(),
                      child: const TodoFilterScreen(),
                    ),
                  ),
                );
              },
              icon: Icon(Icons.filter_alt_rounded),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Create'),
        onPressed: () {
          _navigateToCreateTodoScreen(context);
        },
        icon: Icon(Icons.add),
      ),
      body: const Column(
        children: [
          TodoSearchTextField(),
          Expanded(
            child: AllTodoListBuilder(),
          ),
        ],
      ),
    );
  }

  void _navigateToCreateTodoScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (newContext) => ChangeNotifierProvider.value(
          value: context.read<TodoViewModel>(),
          child: const CreateTodoScreen(),
        ),
      ),
    );
  }
}
