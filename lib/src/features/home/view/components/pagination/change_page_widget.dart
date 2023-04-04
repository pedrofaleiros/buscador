import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';

class ChangePageWidget extends StatelessWidget {
  const ChangePageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<HomeController>(
        builder: (_, controller, __) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: controller.start == 0
                  ? null
                  : () async {
                      await controller.setPage(-1);
                    },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            Text(
              ((controller.start / controller.rows) + 1).toStringAsFixed(0),
              style: const TextStyle(fontSize: 18),
            ),
            IconButton(
              onPressed:
                  (controller.start + controller.rows > controller.numFound)
                      ? null
                      : () async {
                          await controller.setPage(1);
                        },
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
