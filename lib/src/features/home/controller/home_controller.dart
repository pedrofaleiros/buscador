import 'package:buscador/src/features/home/model/arquivo_model.dart';
import 'package:buscador/src/features/home/view_models/home_viewmodel.dart';
import 'package:buscador/src/features/home/view_models/interface/home_viewmodel_interface.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  HomeViewmodelInterface viewmodel = HomeViewmodel();

  String? _authorFilter;
  set authorFilter(String value) {
    if (value == '') {
      _authorFilter = null;
    } else {
      _authorFilter = value;
    }
    notifyListeners();
  }

  List<ArquivoModel> _arquivos = [];
  List<ArquivoModel> get arquivos => _arquivos;
  set arquivos(List<ArquivoModel> data) {
    _arquivos = data;
    notifyListeners();
  }

  Future<void> getArquivos() async {
    final res = viewmodel.getArquivos();

    arquivos = res;

    notifyListeners();
  }

  Future<void> reloadArquivos(String value) async {
    authorFilter = value;

    await loadArquivos();
  }

  Future<void> loadArquivos() async {
    final res = await viewmodel.loadArquivos(author: _authorFilter);

    if (res != null) {
      _arquivos = res;
      notifyListeners();
    }
  }
}
