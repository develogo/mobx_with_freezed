import 'package:dio/dio.dart';
import 'package:mobxfreezed/app/core/models/todo_model.dart';

class TodoService {
  final Dio _dio;

  TodoService(this._dio);

  Future<List<TodoModel>> getTodos() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/todos/');
      return TodoModel.fromJsonList(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
