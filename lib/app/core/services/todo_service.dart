import 'package:dio/dio.dart';
import 'package:mobxfreezed/app/core/models/todo_model.dart';
import 'package:retrofit/retrofit.dart';

part 'todo_service.g.dart';

@RestApi()
abstract class TodoService {
  factory TodoService(Dio dio) = _TodoService;

  @GET("/todos/")
  Future<List<TodoModel>> getTodos();
}
