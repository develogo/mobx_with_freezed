import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobxfreezed/app/core/models/todo_model.dart';
import 'package:mobxfreezed/app/core/widgets/cicular_progress_widget.dart';
import 'package:mobxfreezed/app/core/widgets/error_widget.dart';
import 'package:mobxfreezed/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Todo List"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    store.fetchData();
    super.initState();
  }

  Widget buildData(List<TodoModel> todos) {
    return ListView.separated(
      itemCount: todos.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final todo = todos[index];
        return CheckboxListTile(
          title: Text(todo.title),
          value: todo.completed,
          onChanged: (value) {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () => Modular.to.pushNamed('/photos'),
            icon: const Icon(Icons.photo),
          ),
          IconButton(
            onPressed: store.fetchData,
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          return store.state.when(
            initial: () => const SizedBox.shrink(),
            data: (v) => buildData(v),
            loading: () => const CircularProgressWidget(),
            error: (v) => ErrorMessageWidget(error: v),
          );
        },
      ),
    );
  }
}
