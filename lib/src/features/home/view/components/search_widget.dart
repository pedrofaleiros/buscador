import 'package:buscador/src/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'filter_checkbox.dart';
import 'search_text_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          SearchTextField(),
          DateFilter(),
          FilterCheckbox(),
        ],
      ),
    );
  }
}

class DateFilter extends StatelessWidget {
  const DateFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Filtrar por ano:'),
          SizedBox(
            height: 50,
            width: 100,
            child: TextField(
              onChanged: (value) async {
                final intValue = int.tryParse(value) ?? 0;

                if (intValue > 2000 && intValue < 2024) {
                  await Provider.of<HomeController>(context, listen: false)
                      .setInitialDate(intValue);
                }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'inicio',
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
          ),
          SizedBox(
            height: 50,
            width: 100,
            child: TextField(
              onChanged: (value) async {
                final intValue = int.tryParse(value) ?? 0;

                if (intValue > 2000 && intValue < 2024) {
                  await Provider.of<HomeController>(context, listen: false)
                      .setFinalDate(intValue);
                }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'fim',
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
          ),
        ],
      ),
    );
  }
}
