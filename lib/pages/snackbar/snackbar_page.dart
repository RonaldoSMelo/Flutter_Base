import 'package:flutter/material.dart';

class SnackbarPage extends StatelessWidget {
  const SnackbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  const snackbar = SnackBar(
                    content: Text('Salvo com sucesso!! '),
                    backgroundColor: Colors.black,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
                child: const Text('Simple Snackbar')),
            ElevatedButton(
              onPressed: () {
                var snackbar = SnackBar(
                  content: const Text('Salvo com sucesso!! '),
                  backgroundColor: Colors.black,
                  action: SnackBarAction(
                      label: 'Desfazer',
                      onPressed: () {
                        debugPrint('Clicado');
                      }),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              },
              child: const Text('Action Snackbar'),
            ),
          ],
        ),
      ),
    );
  }
}
