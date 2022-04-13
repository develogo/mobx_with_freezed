import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobxfreezed/app/core/models/todo_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;
  const factory HomeState.data(List<TodoModel> value) = Data;
  const factory HomeState.loading() = Loading;
  const factory HomeState.error([String? message]) = ErrorDetails;
}
