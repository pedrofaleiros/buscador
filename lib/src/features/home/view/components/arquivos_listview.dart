import 'package:flutter/material.dart';

import '../../controller/home_controller.dart';

import 'package:provider/provider.dart';

import 'arquivo_widget.dart';

class ArquivosListView extends StatelessWidget {
  const ArquivosListView({
    super.key,
  });

  Widget get _emptyText => const Center(
        child: Text('Vazio'),
      );

  Widget get _loadingIndicator => const Center(
        child: CircularProgressIndicator(),
      );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
        child: Consumer<HomeController>(
          builder: (_, controller, __) => controller.isLoading
              ? _loadingIndicator
              : controller.arquivos.isEmpty
                  ? _emptyText
                  : ListView.builder(
                      itemCount: controller.arquivos.length,
                      itemBuilder: (_, index) => Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ArquivoWidget(
                            arquivo: controller.arquivos[index],
                            index: index,
                          ),
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}
