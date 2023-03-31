import 'package:buscador/src/features/home/controller/home_controller.dart';
import 'package:buscador/src/features/home/view/components/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget get _loadingIndicator =>
      const Center(child: CircularProgressIndicator());

  AppBar _homeAppBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.help),
        ),
      ],
      iconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Colors.white,
      title: Text(
        'Busque por arquivos',
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: _homeAppBar(context),
      body: FutureBuilder(
        future: context.read<HomeController>().fetchArquivos(),
        builder: (_, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? _loadingIndicator
                : const HomeWidget(),
      ),
    );
  }
}
