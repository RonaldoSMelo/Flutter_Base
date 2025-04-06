import 'package:flutter/material.dart';

class StackPage2 extends StatelessWidget {
  const StackPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack 2'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://destinosnotaveis.com.br/wp-content/uploads/2020/07/Brooklyn-Bridge-NY-2.jpg',
                    ),
                    fit: BoxFit.cover)),
          ),
          Container(
            color: Colors.white12,
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 48,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 9,
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'New York',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                        'Nova York é uma das cidades mais icônicas do mundo, conhecida por sua energia vibrante, arranha-céus imponentes e diversidade cultural. Com pontos turísticos como a Estátua da Liberdade, Central Park e Times Square, a cidade atrai milhões de visitantes todos os anos. Seu ritmo frenético e a mistura de culturas a tornam única, oferecendo uma experiência inesquecível para quem a visita.'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
