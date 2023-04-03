import 'package:flutter/material.dart';

import 'filter_checkbox.dart';
import '../pagination/pagination_widget.dart';
import 'search_text_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          SearchTextField(),
          FilterCheckbox(),
          PaginationWidget(),
        ],
      ),
    );
  }
}

/* 
Text(value.toString()),
          Slider(
            max: 10,
            min: 1,
            divisions: 10,
            value: value,
            onChanged: (value) {
              var intValue = int.tryParse(value.toStringAsFixed(0)) ?? 1;

              setState(() {
                this.value = double.tryParse(intValue.toString()) ?? 1;
              });
            },
          ),
 */