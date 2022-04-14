import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobxfreezed/app/core/models/photo_model.dart';
import 'package:mobxfreezed/app/core/widgets/cicular_progress_widget.dart';
import 'package:mobxfreezed/app/core/widgets/error_widget.dart';
import 'package:mobxfreezed/app/modules/photos/photos_store.dart';

class PhotosPage extends StatefulWidget {
  final String title;
  const PhotosPage({Key? key, this.title = 'PhotosPage'}) : super(key: key);
  @override
  PhotosPageState createState() => PhotosPageState();
}

class PhotosPageState extends State<PhotosPage> {
  final PhotosStore store = Modular.get();

  Widget buidData(List<PhotoModel> photos) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Image.network(photos[index].url),
        );
      },
    );
  }

  @override
  void initState() {
    store.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          return store.state.when(
            initial: () => const SizedBox.shrink(),
            data: (value) => buidData(value),
            loading: () => const CircularProgressWidget(),
            error: (value) => ErrorMessageWidget(error: value),
          );
        },
      ),
    );
  }
}
