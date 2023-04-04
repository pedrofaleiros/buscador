import 'package:buscador/src/features/home/view/page/home_page.dart';
import 'package:flutter/material.dart';

import '../../features/favorites/view/pages/favorite_page.dart';

BottomNavigationBar MyBottomNavigationBar(BuildContext context, int index) {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Buscar',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Favoritos',
      ),
    ],
    currentIndex: index,
    selectedItemColor: Theme.of(context).colorScheme.primary,
    onTap: (value) {
      if (value == 1) {
        Navigator.pushReplacementNamed(context, FavoritePage.routeName);
      } else {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      }
    },
  );
}
