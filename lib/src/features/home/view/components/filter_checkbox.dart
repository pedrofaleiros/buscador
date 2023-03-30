import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controller.dart';
import '../../model/filter_model.dart';

class FilterCheckbox extends StatelessWidget {
  const FilterCheckbox({
    super.key,
  });

  Widget get _authorCheckbox => Row(
        children: [
          const Text('Autor'),
          Consumer<HomeController>(
            builder: (_, controller, __) => Checkbox(
              value: controller.filterType == FilterType.author,
              onChanged: (value) async {
                // controller.filterType = FilterType.author;
                await controller.setFilterType(FilterType.author);
              },
            ),
          ),
        ],
      );

  Widget get _titleCheckbox => Row(
        children: [
          const Text('Titulo'),
          Consumer<HomeController>(
            builder: (_, controller, __) => Checkbox(
              value: controller.filterType == FilterType.title,
              onChanged: (value) async {
                // controller.filterType = FilterType.title;
                await controller.setFilterType(FilterType.title);
              },
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(child: Text('Buscar por:')),
        _authorCheckbox,
        _titleCheckbox,
      ],
    );
  }
}
