import 'package:flutter/material.dart';

import '../../model/arquivo_model.dart';

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
    return ListTile(
      title: Text('$index: ${arquivo.title}'),
      subtitle: Text(arquivo.author),
      trailing: Text('Publicação:\n ${arquivo.year}'),
    );
  }
}