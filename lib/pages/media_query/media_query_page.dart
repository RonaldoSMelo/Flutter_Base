import 'package:flutter/material.dart';

class MediaQueryPage extends StatelessWidget {
  const MediaQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    print(' Largura ${mediaQuery.size.width}');
    print('Altura ${mediaQuery.size.height}');
    print('Orientação ${mediaQuery.orientation}');
    print('Padding TOP ${mediaQuery.padding.top}');
    print('Tamanho AppBarDefoult ${kToolbarHeight}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaQuery'),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: mediaQuery.size.width * .5,
            height: (mediaQuery.size.height -
                    mediaQuery.padding.top -
                    kToolbarHeight) *
                .5,
            color: Colors.red,
          ),
          Container(
            width: mediaQuery.size.width,
            height: (mediaQuery.size.height -
                    mediaQuery.padding.top -
                    kToolbarHeight) *
                .5,
            color: Colors.blue,
          )
        ],
      )),
    );
  }
}
