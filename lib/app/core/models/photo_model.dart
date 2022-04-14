import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
  PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) => _$PhotoModelFromJson(json);

  static List<PhotoModel> fromJsonList(List<dynamic> list) => list.map((e) => PhotoModel.fromJson(e)).toList();

  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}
