import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/pages/bottom_navigator_bar/page1.dart';
import 'package:flutter_primeiro_projeto/pages/bottom_navigator_bar/page2.dart';

class BottomNavigatorBarPage extends StatefulWidget {
  const BottomNavigatorBarPage({super.key});

  @override
  State<BottomNavigatorBarPage> createState() => _BottomNavigatorBarPageState();
}

class _BottomNavigatorBarPageState extends State<BottomNavigatorBarPage> {
  int indice = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (index) {
          setState(() {
            indice = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new),
            label: 'Accessibility',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
      ),
      body: IndexedStack(
        index: indice,
        children: const [
          Page1(),
          Page2(),
        ],
      ),
    );
  }
}
