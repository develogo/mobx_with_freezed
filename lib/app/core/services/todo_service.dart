import 'package:dio/dio.dart';
import 'package:mobxfreezed/app/core/models/todo_model.dart';

class TodoService {
  final Dio _dio;

  TodoService(this._dio);

  Future<List<TodoModel>> getTodos() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/todos/');

      final data = (response.data as List).map((e) => TodoModel.fromMap(e)).toList();

      return data;
    } catch (e) {
      rethrow;
    }
  }
}
