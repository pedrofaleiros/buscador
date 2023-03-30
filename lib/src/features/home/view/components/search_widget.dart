import 'package:flutter/material.dart';

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
          FilterCheckbox(),
        ],
      ),
    );
  }
}
