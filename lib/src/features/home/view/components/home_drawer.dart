import 'package:buscador/src/features/favorites/view/pages/favorite_page.dart';
import 'package:buscador/src/features/home/view/page/home_page.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            iconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.primary,
            ),
            backgroundColor: Colors.white,
          ),
          ListTile(
            title: const Text('Home Page'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
          ),
          ListTile(
            title: const Text('Favoritos'),
            leading: const Icon(Icons.star),
            onTap: () {
              Navigator.pushReplacementNamed(context, FavoritePage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
