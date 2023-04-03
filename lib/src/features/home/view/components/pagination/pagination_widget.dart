import 'package:flutter/material.dart';

import 'change_page_widget.dart';
import 'dropdown_widget.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        ChangePageWidget(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Resultados por página:'),
        ),
        DropDownWidget(),
      ],
    );
  }
}
