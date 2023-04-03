import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (_, controller, __) => DropdownButton<int>(
        value: controller.rows,
        items: const [
          DropdownMenuItem(
            value: 10,
            child: Text('10'),
          ),
          DropdownMenuItem(
            value: 25,
            child: Text('25'),
          ),
          DropdownMenuItem(
            value: 50,
            child: Text('50'),
          ),
          DropdownMenuItem(
            value: 100,
            child: Text('100'),
          ),
        ],
        onChanged: (int? value) async {
          await controller.setRows(value ?? 25);
        },
      ),
    );
  }
}
