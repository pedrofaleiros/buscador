import 'package:buscador/src/common/models/arquivo_model.dart';
import 'package:buscador/src/features/home/model/filter_model.dart';

abstract class HomeViewmodelInterface {
  int get numFound;

  List<ArquivoModel> getArquivos();

  Future<List<ArquivoModel>?> loadArquivos({required FilterModel filters});
  Future<List<ArquivoModel>?> fetchArquivos();
}
