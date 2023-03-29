import 'package:buscador/src/features/home/model/arquivo_model.dart';

abstract class HomeViewmodelInterface {
  List<ArquivoModel> getArquivos();

  Future<List<ArquivoModel>?> loadArquivos({required String? author});
}
