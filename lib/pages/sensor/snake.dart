import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Snake extends StatefulWidget {
  const Snake({
    super.key,
    required this.rows,
    required this.columns,
    required this.cellSize,
  });

  final int rows;
  final int columns;
  final double cellSize;

  @override
  State<Snake> createState() => _SnakeState();
}

class _SnakeState extends State<Snake> {
  static const int _snakeLength = 5;
  static const Duration _snakeSpeed = Duration(milliseconds: 100);

  late List<Offset> _snake;
  late Offset _food;
  late Timer _timer;
  late Offset _direction;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _resetGame();
    _startGame();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _resetGame() {
    _snake = List.generate(
      _snakeLength,
      (index) => Offset(
        (widget.columns ~/ 2 - index).toDouble(),
        (widget.rows ~/ 2).toDouble(),
      ),
    );
    _direction = const Offset(1, 0);
    _generateFood();
  }

  void _startGame() {
    _isPlaying = true;
    _timer = Timer.periodic(_snakeSpeed, (timer) {
      setState(() {
        _moveSnake();
      });
    });

    userAccelerometerEventStream().listen((UserAccelerometerEvent event) {
      if (!_isPlaying) return;

      final x = event.x;
      final y = event.y;

      if (x.abs() > y.abs()) {
        if (x > 0 && _direction != const Offset(-1, 0)) {
          _direction = const Offset(1, 0);
        } else if (x < 0 && _direction != const Offset(1, 0)) {
          _direction = const Offset(-1, 0);
        }
      } else {
        if (y > 0 && _direction != const Offset(0, -1)) {
          _direction = const Offset(0, 1);
        } else if (y < 0 && _direction != const Offset(0, 1)) {
          _direction = const Offset(0, -1);
        }
      }
    });
  }

  void _moveSnake() {
    final head = _snake.first;
    final newHead = head + _direction;

    if (_isCollision(newHead)) {
      _resetGame();
      return;
    }

    _snake.insert(0, newHead);

    if (newHead == _food) {
      _generateFood();
    } else {
      _snake.removeLast();
    }
  }

  bool _isCollision(Offset position) {
    if (position.dx < 0 ||
        position.dx >= widget.columns ||
        position.dy < 0 ||
        position.dy >= widget.rows) {
      return true;
    }

    return _snake.contains(position);
  }

  void _generateFood() {
    final random = Random();
    do {
      _food = Offset(
        random.nextInt(widget.columns).toDouble(),
        random.nextInt(widget.rows).toDouble(),
      );
    } while (_snake.contains(_food));
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _SnakePainter(
        snake: _snake,
        food: _food,
        cellSize: widget.cellSize,
      ),
    );
  }
}

class _SnakePainter extends CustomPainter {
  _SnakePainter({
    required this.snake,
    required this.food,
    required this.cellSize,
  });

  final List<Offset> snake;
  final Offset food;
  final double cellSize;

  @override
  void paint(Canvas canvas, Size size) {
    final snakePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final foodPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    for (final segment in snake) {
      canvas.drawRect(
        Rect.fromLTWH(
          segment.dx * cellSize,
          segment.dy * cellSize,
          cellSize,
          cellSize,
        ),
        snakePaint,
      );
    }

    canvas.drawRect(
      Rect.fromLTWH(
        food.dx * cellSize,
        food.dy * cellSize,
        cellSize,
        cellSize,
      ),
      foodPaint,
    );
  }

  @override
  bool shouldRepaint(_SnakePainter oldDelegate) {
    return snake != oldDelegate.snake || food != oldDelegate.food;
  }
}
