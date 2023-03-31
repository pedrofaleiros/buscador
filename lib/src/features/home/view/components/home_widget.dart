import 'package:flutter/material.dart';

import 'arquivos_listview.dart';
import 'search_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SearchWidget(),
        ArquivosListView(),
      ],
    );
  }
}
