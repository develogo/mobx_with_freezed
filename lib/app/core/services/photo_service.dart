import 'package:dio/dio.dart';
import 'package:mobxfreezed/app/core/models/photo_model.dart';
import 'package:retrofit/retrofit.dart';

part 'photo_service.g.dart';

@RestApi()
abstract class PhotoService {
  factory PhotoService(Dio dio) = _PhotoService;

  @GET("/photos/")
  Future<List<PhotoModel>> getPhotos();
}
