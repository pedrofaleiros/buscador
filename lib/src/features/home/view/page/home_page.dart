import 'dart:convert';
import 'dart:typed_data';

import 'package:buscador/src/features/home/controller/home_controller.dart';
import 'package:buscador/src/features/home/model/arquivo_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';

import '../components/arquivos_listview.dart';
import '../components/search_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: FutureBuilder(
        future:
            Provider.of<HomeController>(context, listen: false).loadArquivos(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: const [
              SearchTextField(),
              ArquivosListView(),
            ],
          );
        },
      ),
    );
  }
}
