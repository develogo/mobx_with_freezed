import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:mobxfreezed/app/core/services/todo_service.dart';
import 'package:mobxfreezed/app/modules/home/home_state.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final TodoService _todoService;

  HomeStoreBase(this._todoService);

  @observable
  HomeState state = const HomeState.initial();

  @action
  void fetchData() {
    state = const HomeState.loading();
    _todoService.getTodos().then((value) {
      state = HomeState.data(value);
    }).onError<DioError>((error, stackTrace) {
      state = HomeState.error(error.message);
    }).catchError((error) {
      state = const HomeState.error('Erro to fetch data');
    });
  }
}
