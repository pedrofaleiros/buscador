import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/favorite_controller.dart';
import 'favorite_arquivo.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({
    super.key,
  });

  Widget get _noFavorites => const Center(
        child: Text(
          'Sem favoritos ainda',
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteController>(
      builder: (_, controller, __) => controller.arquivos.isEmpty
          ? _noFavorites
          : ListView.builder(
              itemCount: controller.arquivos.length,
              itemBuilder: (_, index) => Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FavoriteArquivo(
                    arquivo: controller.arquivos[index],
                  ),
                ),
              ),
            ),
    );
  }
}
