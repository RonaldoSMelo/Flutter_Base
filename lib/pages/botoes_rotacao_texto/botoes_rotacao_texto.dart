import 'package:flutter/material.dart';

class BotoesRotacaoTexto extends StatelessWidget {
  const BotoesRotacaoTexto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Botões e Rotação de Texto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.red,
                    child: const Text('Ronaldo Melo'),
                  ),
                ),
                const Icon(Icons.ac_unit)
              ],
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                padding: const EdgeInsets.all(50),
                minimumSize: const Size(50, 10),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              child: const Text('Salvar'),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.exit_to_app)),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shadowColor: Colors.blue,
              ),
              child: const Text('Salvar'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.airplane_ticket),
              label: const Text('Modo avião'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shadowColor: const WidgetStatePropertyAll(Colors.blue),
                minimumSize: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return const Size(100, 100);
                  }
                  return const Size(100, 20);
                }),
                overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.hovered)) {
                    return Colors.yellow;
                  }
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.black;
                  }
                  return Colors.transparent;
                }),
              ),
              child: const Text('Salvar'),
            ),
            InkWell(
              onTap: () {},
              child: const Text('Inkwell'),
            ),
            GestureDetector(
              child: const Text('Gesture dector'),
              onTap: () => debugPrint('Gesture Clicado'),
              onVerticalDragStart: (_) =>
                  // ignore: no_wildcard_variable_uses
                  debugPrint('Gesture Movimentado Star $_'),
            ),
            // Container(
            //   width: 300,
            //   height: 100,
            //   decoration: const BoxDecoration(
            //       gradient:
            //           LinearGradient(colors: [Colors.blue, Colors.green])),
            // )
          ],
        ),
      ),
    );
  }
}
