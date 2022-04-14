import 'package:mobx/mobx.dart';
import 'package:mobxfreezed/app/core/services/photo_service.dart';
import 'package:mobxfreezed/app/modules/photos/photos_state.dart';

part 'photos_store.g.dart';

class PhotosStore = _PhotosStoreBase with _$PhotosStore;

abstract class _PhotosStoreBase with Store {
  final PhotoService _service;

  _PhotosStoreBase(this._service);

  @observable
  PhotosState state = const PhotosState.initial();

  @action
  void fetchData() {
    state = const PhotosState.loading();
    _service.getPhotos().then((data) {
      state = PhotosState.data(data);
    }).catchError((e) {
      state = const PhotosState.error('Erro to load photos');
    });
  }
}
