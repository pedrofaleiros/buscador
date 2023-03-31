import 'package:buscador/src/features/home/model/arquivo_model.dart';
import 'package:buscador/src/features/home/model/filter_model.dart';
import 'package:buscador/src/features/home/view_models/home_viewmodel.dart';
import 'package:buscador/src/features/home/view_models/interface/home_viewmodel_interface.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  HomeViewmodelInterface viewmodel = HomeViewmodel();
  bool _isLoading = false;
  FilterModel _filter = FilterModel(
    type: FilterType.author,
    args: '',
    initialDate: 0,
    finalDate: 2024,
    rows: 50,
    start: 0,
  );
  List<ArquivoModel> _arquivos = [];

  bool get isLoading => _isLoading;
  List<ArquivoModel> get arquivos => _arquivos;
  FilterType get filterType => _filter.type;

  Future<void> setFilterType(FilterType value) async {
    _filter = _filter.copyWith(type: value);
    // await reloadArquivos(_filter.args);
    if (_filter.args.isEmpty || _filter.args == '') {
      notifyListeners();
      return;
    }
    await loadArquivos();
  }

  Future<void> setFilterArgs(String value) async {
    if (value == '' || value.isEmpty) {
      _filter = _filter.copyWith(args: '');
    } else {
      _filter = _filter.copyWith(args: value);
    }
    await loadArquivos();
  }

  Future<void> loadArquivos() async {
    _isLoading = true;
    notifyListeners();

    // await Future.delayed(Duration(seconds: 1));
    final res = await viewmodel.loadArquivos(filters: _filter);

    if (res != null) {
      _arquivos = res;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchArquivos() async {
    final res = await viewmodel.fetchArquivos();

    if (res != null) {
      _arquivos = res;
    } else {
      // _arquivos = viewmodel.getArquivos();
    }
    notifyListeners();
  }
}
