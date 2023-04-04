import 'package:buscador/src/features/home/model/arquivo_model.dart';
import 'package:flutter/material.dart';

class FavoriteController with ChangeNotifier {
  // ignore: prefer_final_fields
  List<ArquivoModel> _arquivos = [];

  List<ArquivoModel> get arquivos => _arquivos;

  String? addArquivo(ArquivoModel arquivo) {
    final hasArquivo = _arquivos.contains(arquivo);
    if (!hasArquivo) {
      _arquivos.add(arquivo);
    } else {
      _arquivos.removeWhere((element) => element.id == arquivo.id);
    }

    notifyListeners();

    return hasArquivo ? 'Ja adicionado' : null;
  }

  bool findById(String id) {
    for (int i = 0; i < _arquivos.length; i++) {
      if (_arquivos[i].id == id) {
        return true;
      }
    }

    return false;
  }

  String getJsonArquivos() {
    List<String> lista = _arquivos.map((e) => e.toJson()).toList();

    return '"{"lista":${lista}}"';
  }

  List<Map<String, dynamic>> getMapArquivos() =>
      _arquivos.map((e) => e.toMap()).toList();
}
