import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controller.dart';
import '../../model/filter_model.dart';

class FilterCheckbox extends StatelessWidget {
  const FilterCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(child: Text('Buscar por:')),
          AuthorCheckbox(),
          TitleCheckbox(),
        ],
      ),
    );
  }
}

class AuthorCheckbox extends StatelessWidget {
  const AuthorCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Autor'),
        Consumer<HomeController>(
          builder: (_, controller, __) => Checkbox(
            activeColor: Theme.of(context).colorScheme.primary,
            value: controller.filterType == FilterType.author,
            onChanged: (value) async {
              // controller.filterType = FilterType.author;
              await controller.setFilterType(FilterType.author);
            },
          ),
        ),
      ],
    );
  }
}

class TitleCheckbox extends StatelessWidget {
  const TitleCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Titulo'),
        Consumer<HomeController>(
          builder: (_, controller, __) => Checkbox(
            activeColor: Theme.of(context).colorScheme.primary,
            value: controller.filterType == FilterType.title,
            onChanged: (value) async {
              // controller.filterType = FilterType.title;
              await controller.setFilterType(FilterType.title);
            },
          ),
        ),
      ],
    );
  }
}
