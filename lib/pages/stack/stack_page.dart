import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.amber,
            width: 200,
            height: 200,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
          Positioned(
            // top: 40,
            right: 100,
            bottom: 10,
            child: Container(
              color: Colors.pink,
              width: 150,
              height: 150,
            ),
          )
        ],
      ),
    );
  }
}
