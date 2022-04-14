import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobxfreezed/app/core/models/photo_model.dart';

part 'photos_state.freezed.dart';

@freezed
class PhotosState with _$PhotosState {
  const factory PhotosState.initial() = Initial;
  const factory PhotosState.data(List<PhotoModel> data) = Data;
  const factory PhotosState.loading() = Loading;
  const factory PhotosState.error([String? message]) = ErrorDetails;
}
