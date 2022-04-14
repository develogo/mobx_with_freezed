import 'package:mobxfreezed/app/core/services/photo_service.dart';
import 'package:mobxfreezed/app/modules/photos/photos_Page.dart';
import 'package:mobxfreezed/app/modules/photos/photos_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PhotosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PhotosStore(i())),
    Bind.lazySingleton((i) => PhotoService(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PhotosPage()),
  ];
}
