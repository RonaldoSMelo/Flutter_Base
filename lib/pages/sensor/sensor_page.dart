import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sensors_plus/sensors_plus.dart';

class StepCounterApp extends StatelessWidget {
  const StepCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contador de Exercícios',
      home: StepCounterPage(),
    );
  }
}

class StepCounterPage extends StatefulWidget {
  const StepCounterPage({super.key});

  @override
  _StepCounterPageState createState() => _StepCounterPageState();
}

class _StepCounterPageState extends State<StepCounterPage> {
  int _steps = 0;
  double _lastMagnitude = 0;
  bool _isStepDetected = false;

  final double _threshold =
      0.8; // Reduzido de 1.5 para 0.8 para maior sensibilidade
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    startListening();
    initTTS();
  }

  void initTTS() async {
    await flutterTts.setLanguage("pt-BR");
    await flutterTts.setSpeechRate(0.5);
  }

  void speak(String text) async {
    await flutterTts.speak(text);
  }

  void startListening() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      double x = event.x;
      double y = event.y;
      double z = event.z;

      // Magnitude do movimento
      double magnitude = sqrt(x * x + y * y + z * z);

      // Filtro simples para suavizar o sinal
      double alpha = 0.6; // Reduzido de 0.8 para 0.6 para maior responsividade
      double filteredMagnitude =
          alpha * _lastMagnitude + (1 - alpha) * magnitude;

      double delta = filteredMagnitude - _lastMagnitude;

      if (delta > _threshold && !_isStepDetected) {
        setState(() {
          _steps++;
          _isStepDetected = true;
        });
        speak("$_steps passos");
      } else if (delta < -_threshold && _isStepDetected) {
        _isStepDetected = false;
      }

      _lastMagnitude = filteredMagnitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contador de Movimentos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Passos detectados:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$_steps',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
