import 'package:flutter/material.dart';

import '../../controller/home_controller.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: (value) async {
          // Provider.of<HomeController>(context, listen: false)
          //     .authorFilter = value;
          await Provider.of<HomeController>(context, listen: false)
              .reloadArquivos(value);
        },
        decoration: InputDecoration(
          labelText: 'Input Text',
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
    );
  }
}
