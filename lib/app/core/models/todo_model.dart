import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  @JsonKey(name: 'userId')
  final int userId;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'completed')
  final bool completed;
  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);

  static List<TodoModel> fromJsonList(List<dynamic> list) => list.map((e) => TodoModel.fromJson(e)).toList();

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
