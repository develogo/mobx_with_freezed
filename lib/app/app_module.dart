import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobxfreezed/app/core/services/global_interceptor.dart';
import 'package:mobxfreezed/app/modules/photos/photos_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => Dio(
        BaseOptions(
          baseUrl: 'http://177.67.209.160:21465',
        ),
      )..interceptors.add(GlobalInterceptor()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/photos', module: PhotosModule()),
  ];
}
