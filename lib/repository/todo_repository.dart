import 'package:todo_list_app/dao/todo_dao.dart';
import 'package:todo_list_app/model/todo.dart';

class TodoRepository {
  final todoDao = TodoDao();

  Future getAllTodos ({String query}) => todoDao.getTodos(query: query);
  Future insertTodo (Todo todo) => todoDao.createTodo(todo);
  Future updateTodo (Todo todo) => todoDao.updateTodo(todo);
  Future deleteTodoById (int id) => todoDao.deleteTodo(id);

  Future deleteAllTodos () => todoDao.deleteAllTodos();
}