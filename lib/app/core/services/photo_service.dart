import 'package:dio/dio.dart';
import 'package:mobxfreezed/app/core/models/photo_model.dart';

class PhotoService {
  final Dio _dio;
  PhotoService(this._dio);

  Future<List<PhotoModel>> getPhotos() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/photos/');
      return PhotoModel.fromJsonList(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
