// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PhotosStore on _PhotosStoreBase, Store {
  final _$stateAtom = Atom(name: '_PhotosStoreBase.state');

  @override
  PhotosState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(PhotosState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$_PhotosStoreBaseActionController =
      ActionController(name: '_PhotosStoreBase');

  @override
  void fetchData() {
    final _$actionInfo = _$_PhotosStoreBaseActionController.startAction(
        name: '_PhotosStoreBase.fetchData');
    try {
      return super.fetchData();
    } finally {
      _$_PhotosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
