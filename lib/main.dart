import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Primeiro Projeto',
      theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.cyan,
          primaryColor: Colors.orangeAccent),
      routes: AppRoutes.routes,
    );
  }
}
