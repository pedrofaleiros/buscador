import 'dart:io';

import 'package:buscador/src/features/favorites/controller/favorite_controller.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../../../common/components/bottom_navigation_bar.dart';
import '../components/favorites_body.dart';

import 'dart:async';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  static const routeName = '/favorites';

  Future<File> createCSV(List<Map<String, dynamic>> data) async {
    List<List<dynamic>> rows = [];

    rows.add(['id', 'title', 'author', 'year']);

    data.forEach(
      (element) {
        String name = element['author'];

        rows.add(
          [element['id'], element['title'], element['author'], element['year']],
        );
      },
    );

    String csvData =
        const ListToCsvConverter().convert(rows, fieldDelimiter: ';');

    print(csvData);

    // final dir = await getExternalStorageDirectory();
    final downloadsPath = await getDownloadsDirectoryPath();

    if (downloadsPath != null) {
      final file = File('$downloadsPath/arquivos.csv');

      return file.writeAsString(csvData);
    } else {
      throw Exception('Falhou aqui');
    }
  }

  Future<String?> getDownloadsDirectoryPath() async {
    const platform = MethodChannel('com.example.buscador/downloads_path');

    try {
      final String res = await platform.invokeMethod('getDownloadsPath');
      return res;
    } on PlatformException catch (e) {
      print(e.message);
      return null;
    }
  }

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Favorites',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final arquivos =
                  context.read<FavoriteController>().getMapArquivos();

              // PermissionStatus status = await Permission.storage.request();
              Permission.storage.request().then((status) async {
                if (status.isGranted) {
                  createCSV(arquivos).then((value) {
                    _showSnackBar(
                      context,
                      'Arquivo CSV foi salvo na pasta de downloads',
                    );
                  }).catchError((e) {
                    _showSnackBar(context, 'Erro');
                  });
                } else {
                  _showSnackBar(context, 'Permissao Negada');
                }
              });
            },
            icon: const Icon(Icons.download),
          )
        ],
      ),
      // drawer: HomeDrawer(),
      bottomNavigationBar: MyBottomNavigationBar(context, 1),
      body: const FavoritesBody(),
    );
  }
}
