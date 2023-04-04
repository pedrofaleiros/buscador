import 'package:buscador/src/features/favorites/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/components/bottom_navigation_bar.dart';
import '../components/favorites_body.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  static const routeName = '/favorites';

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
            onPressed: () {
              final arquivos =
                  context.read<FavoriteController>().getMapArquivos();
              arquivos.forEach((element) => print(element));
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
