import 'package:buscador/src/features/home/model/arquivo_model.dart';
import 'package:buscador/src/features/home/view_models/interface/home_viewmodel_interface.dart';
import 'package:dio/dio.dart';

class HomeViewmodel implements HomeViewmodelInterface {
  final baseUrl = 'http://localhost:8983/solr/teste-arquivos';

  @override
  Future<List<ArquivoModel>?> loadArquivos({required String? author}) async {
    var url = '';

    if (author == null) {
      url = '$baseUrl/select?indent=true&q.op=OR&q=*%3A*&rows=300&useParams=';
    } else {
      url =
          '$baseUrl/select?indent=true&q.op=OR&q=author%3A*$author*&rows=300&useParams=';
    }

    // await Future.delayed(Duration(seconds: 3));
    final dio = Dio();

    dio.options.sendTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 5);
    dio.options.connectTimeout = Duration(seconds: 5);

    try {
      final response = await dio.get(url);

      final lista = response.data['response']['docs'] as List<dynamic>;

      List<ArquivoModel> arqs =
          lista.map((e) => ArquivoModel.fromMapSolr(e)).toList();

      return arqs;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  List<ArquivoModel> getArquivos() {
    // Dados fictícios
    List<ArquivoModel> mockData = [
      ArquivoModel(
        id: '1',
        title: 'Testeeeeeeeeee',
        author: 'João Silva',
        year: 2023,
      ),
      ArquivoModel(
        id: '2',
        title: 'Viagem ao Centro da Terra',
        author: 'Lucas Fernandes',
        year: 2022,
      ),
      ArquivoModel(
        id: '3',
        title: 'Aventuras na Floresta Encantada',
        author: 'Clara Almeida',
        year: 2021,
      ),
      ArquivoModel(
        id: '4',
        title: 'Mistérios da Cidade Perdida',
        author: 'Rodrigo Oliveira',
        year: 2023,
      ),
      ArquivoModel(
        id: '5',
        title: 'O Enigma do Oceano',
        author: 'Rafael Sampaio',
        year: 2021,
      ),
      ArquivoModel(
        id: '6',
        title: 'Lendas do Deserto',
        author: 'Camila Gomes',
        year: 2022,
      ),
      ArquivoModel(
        id: '7',
        title: 'A Magia dos Sonhos',
        author: 'Eduardo Santos',
        year: 2021,
      ),
      ArquivoModel(
        id: '8',
        title: 'A Jornada dos Animais',
        author: 'Manoel Gomes',
        year: 2022,
      ),
      ArquivoModel(
        id: '9',
        title: 'Intrigas no Palácio',
        author: 'Renato Azevedo',
        year: 2021,
      ),
      ArquivoModel(
        id: '10',
        title: 'O Labirinto dos Espíritos',
        author: 'Camila Gomes',
        year: 2023,
      ),
    ];

    return mockData;
  }
}


//http://127.0.0.1:8983/solr/teste-arquivos/select?indent=true&q.op=OR&q= author%3Apedro    &rows=100&useParams=
//http://127.0.0.1:8983/solr/teste-arquivos/select?indent=true&q.op=OR&q=  *%3A*    &rows=100&useParams=