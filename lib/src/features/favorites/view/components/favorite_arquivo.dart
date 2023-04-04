import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/models/arquivo_model.dart';
import '../../controller/favorite_controller.dart';

class FavoriteArquivo extends StatelessWidget {
  const FavoriteArquivo({
    super.key,
    required this.arquivo,
  });

  final ArquivoModel arquivo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${arquivo.year}'),
      title: Text(arquivo.title),
      subtitle: Text('${arquivo.id} - ${arquivo.author}'),
      trailing: IconButton(
        onPressed: () {
          context.read<FavoriteController>().handleTapArquivo(arquivo);
        },
        icon: Icon(
          Icons.delete,
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}
