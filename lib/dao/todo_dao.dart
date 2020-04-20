// data access object

import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list_app/database/database.dart';
import 'package:todo_list_app/model/todo.dart';

class TodoDao{
  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new Todo records
  Future<int> createTodo(Todo todo) async {
    final db = await dbProvider.database;
    var result = db.insert(todoTable, todo.toDatabaseJson());
    return result;
  }

  //Get All Todo items
  //Searches if query string was passed
  Future<List<Todo>> getTodos({List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db.query(todoTable,
            columns: columns,
            where: 'description LIKE ?',
            whereArgs: ["%$query%"]);
    } else {
      result = await db.query(todoTable, columns: columns);
    }

    List<Todo> todos = result.isNotEmpty
        ? result.map((item) => Todo.fromDatabaseJson(item)).toList()
        : [];
    return todos;
  }

  //Update Todo record
  Future<int> updateTodo(Todo todo) async {
    final db = await dbProvider.database;

    var result = await db.update(todoTable, todo.toDatabaseJson(),
        where: "id = ?", whereArgs: [todo.id]);

    return result;
  }

  //Delete Todo records
  Future<int> deleteTodo(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(todoTable, where: 'id = ?', whereArgs: [id]);

    return result;
  }

  //We are not going to use this in the demo
  Future deleteAllTodos() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      todoTable,
    );

    return result;
  }
}