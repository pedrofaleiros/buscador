import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controller.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) async {
        await Provider.of<HomeController>(context, listen: false)
            .setFilterArgs(value);
      },
      decoration: InputDecoration(
        labelText: 'Buscar',
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
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
