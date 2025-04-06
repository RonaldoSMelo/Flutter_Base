import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final cor = Colors.blue.withOpacity(0.5);
    // final cor = const Color.fromRGBO(0, 0, 255, 0.8);
    const cor = Color(0XFF9BDDFB);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cores'),
      ),
      body: Center(
        child: Container(width: 400, height: 400, color: cor),
      ),
    );
  }
}
