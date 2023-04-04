import 'package:buscador/src/common/components/bottom_navigation_bar.dart';
import 'package:buscador/src/features/favorites/view/pages/favorite_page.dart';
import 'package:buscador/src/features/home/controller/home_controller.dart';
import 'package:buscador/src/features/home/view/components/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

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
      // drawer: const HomeDrawer(),
      appBar: _homeAppBar(context),
      bottomNavigationBar: MyBottomNavigationBar(context, 0),
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
