import 'package:buscador/src/features/home/model/filter_model.dart';
import 'package:flutter/material.dart';

import '../../controller/home_controller.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            onChanged: (value) async {
              await Provider.of<HomeController>(context, listen: false)
                  .reloadArquivos(value);
            },
            decoration: InputDecoration(
              labelText: 'Input Text',
              // helperText: 'Helper',
              helperStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: Color(0xffdbdbdb),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Buscar por:'),
              Row(
                children: [
                  Text('Autor'),
                  Consumer<HomeController>(
                    builder: (_, controller, __) => Checkbox(
                      value: controller.filterType == FilterType.author,
                      onChanged: (value) {
                        controller.filterType = FilterType.author;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Titulo'),
                  Consumer<HomeController>(
                    builder: (_, controller, __) => Checkbox(
                      value: controller.filterType == FilterType.title,
                      onChanged: (value) {
                        controller.filterType = FilterType.title;
                      },
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
