import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobxfreezed/app/core/services/todo_service.dart';

import '../home/home_store.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(i())),
    Bind.lazySingleton((i) => TodoService(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
