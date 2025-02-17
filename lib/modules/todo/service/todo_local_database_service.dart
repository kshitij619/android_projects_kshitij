import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:todo_app/core/database/local_database.dart';
import 'package:todo_app/modules/todo/models/get_todo_request_model.dart';
import 'package:todo_app/modules/todo/models/get_todo_response_model.dart';
import 'package:todo_app/modules/todo/models/todo_filter_model.dart';
import 'package:todo_app/modules/todo/models/todo_model.dart';

class TodoLocalDatabaseService {
  final _db = LocalDatabase.instance.database;

  Future<TodoModel?> createTodo(TodoModel model) async {
    // await Future.delayed(Duration(seconds: 1));
    try {
      final id = await _db.insert(
        'todos',
        model.toDatabaseMap(),
      );
      log('Created todo id: $id');
      return model.copyWith(
        id: id,
      );
    } catch (e, s) {
      log(
        'createTodo',
        error: e,
        stackTrace: s,
        name: '$runtimeType',
      );
      return null;
    }
  }

  Future<GetTodoResponseModel?> getAllTodos(GetTodoRequestModel request) async {
    try {
      final total = Sqflite.firstIntValue(
        await _db.rawQuery('SELECT COUNT(*) FROM todos'),
      );
      final queryString =
          'SELECT * from todos ${_getWhereText(request)} ${_getSearchQuery(request.query)} ${_getFiltersQuery(request.filter)} ORDER BY id DESC LIMIT ${request.limit} OFFSET ${request.offset}';

      final result = await _db.rawQuery(queryString);

      // final result = await _db.query(
      //   'todos',
      //   limit: request.limit,
      //   offset: request.offset,
      //   where: request.query.isNotEmpty ? 'title LIKE ?' : null,
      //   orderBy: 'id DESC',
      //   whereArgs: request.query.isNotEmpty ? ['%${request.query}%'] : null,
      // );
      // ! Delay
      await Future.delayed(Duration(seconds: 1));
      final todos = result.map((map) {
        return TodoModel.fromDatabaseMap(map);
      }).toList();

      return GetTodoResponseModel(
        todos: todos,
        total: total ?? 0,
      );
    } catch (e, s) {
      log('getAllTodos', error: e, stackTrace: s, name: '$runtimeType');
      return null;
    }
  }

  Future<TodoModel?> updateTodo(int id, TodoModel model) async {
    try {
      final result = _db.update(
        'todos',
        model.toDatabaseMap(),
        where: 'id = ?',
        whereArgs: [id],
      );
      log('Updated $result todo');
      return model;
    } catch (e, s) {
      log('updateTodo', error: e, stackTrace: s, name: '$runtimeType');
      return null;
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      final result = await _db.delete(
        'todos',
        where: 'id = ?',
        whereArgs: [id],
      );
      log('Deleted $result todo');
    } catch (e, s) {
      log('deleteTodo', error: e, stackTrace: s, name: '$runtimeType');
    }
  }

  String _getSearchQuery(String query) {
    if (query.isEmpty) return '';
    return "WHERE title LIKE '%$query%'";
  }

  String _getFiltersQuery(TodoFilterModel filter) {
    if (filter.category.isEmpty &&
        filter.status.isEmpty &&
        filter.priority.isEmpty) {
      return '';
    }
    String query = '';
    if (filter.category.isNotEmpty) {
      if (query.isEmpty) {
        query = 'category IN (${filter.category.join(',')})';
      } else {
        query = '$query AND category IN (${filter.category.join(',')})';
      }
    }
    if (filter.status.isNotEmpty) {
      if (query.isEmpty) {
        query = 'status IN (${filter.status.join(',')})';
      } else {
        query = '$query AND status IN (${filter.status.join(',')})';
      }
    }
    if (filter.priority.isNotEmpty) {
      if (query.isEmpty) {
        query = 'priority IN (${filter.priority.join(',')})';
      } else {
        query = '$query AND priority IN (${filter.priority.join(',')})';
      }
    }
    log(query);
    return query;
  }

  String _getWhereText(GetTodoRequestModel request) {
    if (request.query.isEmpty &&
        request.filter.category.isEmpty &&
        request.filter.status.isEmpty &&
        request.filter.priority.isEmpty) {
      return '';
    }
    return 'WHERE';
  }
}
