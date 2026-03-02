import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorChangeScreen(),
    );
  }
}

class ColorChangeScreen extends StatefulWidget {
  const ColorChangeScreen({super.key});

  @override
  State<ColorChangeScreen> createState() => _ColorChangeScreenState();
}

class _ColorChangeScreenState extends State<ColorChangeScreen> {
  Color _backgroundColor = Colors.white;
  Color _textColor = Colors.black;
  final Random _random = Random();

  void _changeBackgroundColor() {
    setState(() {
      final int r = _random.nextInt(256);
      final int g = _random.nextInt(256);
      final int b = _random.nextInt(256);
      _backgroundColor = Color.fromRGBO(r, g, b, 1.0);

      final double luminance = _backgroundColor.computeLuminance();
      _textColor = luminance > 0.5 ? Colors.black : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _changeBackgroundColor,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          color: _backgroundColor,
          alignment: Alignment.center,
          child: Center(
            child: Text(
              'Hello there',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: _textColor
                ),
            ),
          ),
        ),
      ),
    );
  }
}