import 'package:buscador/src/features/favorites/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/models/arquivo_model.dart';

class ArquivoWidget extends StatelessWidget {
  const ArquivoWidget({
    super.key,
    required this.arquivo,
    required this.index,
  });

  final ArquivoModel arquivo;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteController>(
      builder: (_, favoriteController, __) => Card(
        color: favoriteController.findById(arquivo.id)
            ? Theme.of(context).colorScheme.secondaryContainer
            : Colors.white,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(arquivo.title),
            subtitle: Text(arquivo.author),
            leading: Text('${arquivo.year}'),
            onTap: () {
              context.read<FavoriteController>().handleTapArquivo(arquivo);
            },
            trailing: Checkbox(
              value: favoriteController.findById(arquivo.id),
              onChanged: (value) {
                favoriteController.handleTapArquivo(arquivo);
              },
            ),
          ),
        ),
      ),
    );
  }
}
