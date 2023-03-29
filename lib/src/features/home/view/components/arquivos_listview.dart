import 'package:flutter/material.dart';

import '../../controller/home_controller.dart';

import 'package:provider/provider.dart';

class ArquivosListView extends StatelessWidget {
  const ArquivosListView({
    super.key,
  });

  Widget get _emptyText => const Center(
        child: Text('Vazio'),
      );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<HomeController>(
        builder: (_, controller, __) => controller.arquivos.isEmpty
            ? _emptyText
            : ListView.builder(
                itemCount: controller.arquivos.length,
                itemBuilder: (_, index) => Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title:
                          Text('${index} - ${controller.arquivos[index].title}'),
                      subtitle: Text(controller.arquivos[index].author),
                      trailing: Text(
                          'Publicação:\n ${controller.arquivos[index].year}'),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
