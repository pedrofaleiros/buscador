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
          const ListTile(title: Text('Elemento 1'), leading: Icon(Icons.person),),
          const ListTile(title: Text('Elemento 2'), leading: Icon(Icons.person),),
          const ListTile(title: Text('Elemento 3'), leading: Icon(Icons.person),),
        ],
      ),
    );
  }
}
