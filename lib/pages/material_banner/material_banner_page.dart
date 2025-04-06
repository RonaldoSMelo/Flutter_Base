import 'package:flutter/material.dart';

class MaterialBannerPage extends StatelessWidget {
  const MaterialBannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Banner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  var materialBanner = MaterialBanner(
                    content: const Text('Usuário salvo com sucesso!! '),
                    backgroundColor: Colors.black,
                    //forceActionsBelow: true,
                    actions: [
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner();
                        },
                        child: const Text('Cancelar'),
                      )
                    ],
                  );
                  ScaffoldMessenger.of(context)
                      .showMaterialBanner(materialBanner);
                  Future.delayed(const Duration(seconds: 2), () {
                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                  });
                },
                child: const Text('Material Banner')),
          ],
        ),
      ),
    );
  }
}
