import 'dart:convert';

import 'package:buscador/src/features/favorites/controller/favorite_controller.dart';
import 'package:buscador/src/features/home/view/components/arquivo_widget.dart';
import 'package:buscador/src/features/home/view/components/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  static const routeName = '/favorites';

  Widget get _noFavorites => const Center(
        child: Text(
          'Sem favoritos ainda',
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      drawer: HomeDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final arquivos = context.read<FavoriteController>().getMapArquivos();

          arquivos.forEach((element) => print(element));
        },
        child: const Icon(Icons.download),
      ),
      body: Consumer<FavoriteController>(
        builder: (_, controller, __) => controller.arquivos.isEmpty
            ? _noFavorites
            : ListView.builder(
                itemCount: controller.arquivos.length,
                itemBuilder: (_, index) => Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                          '${index + 1}: ${controller.arquivos[index].title}'),
                      subtitle: Text(
                          '${controller.arquivos[index].id} - ${controller.arquivos[index].author}'),
                      trailing: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        child: IconButton(
                          onPressed: () {
                            controller.addArquivo(controller.arquivos[index]);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
