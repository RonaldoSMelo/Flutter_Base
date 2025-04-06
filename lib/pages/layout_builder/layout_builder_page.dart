import 'package:flutter/material.dart';

class LayoutBuilderPage extends StatelessWidget {
  const LayoutBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LayoutBuilder'),
      ),
      body: Center(child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: constraints.maxHeight * .1,
              height: constraints.maxHeight * .5,
              color: Colors.red,
            ),
            Container(
              width: constraints.maxHeight,
              height: constraints.maxHeight * .5,
              color: Colors.blue,
            )
          ],
        );
      })),
    );
  }
}
