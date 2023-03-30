import 'package:buscador/src/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/arquivos_listview.dart';
import '../components/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget get _loadingIndicator =>
      const Center(child: CircularProgressIndicator());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busque por arquivos'),
      ),
      body: FutureBuilder(
        future:
            Provider.of<HomeController>(context, listen: false).fetchArquivos(),
        builder: (_, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? _loadingIndicator
                : Column(
                    children: const [
                      SearchWidget(),
                      ArquivosListView(),
                    ],
                  ),
      ),
    );
  }
}
