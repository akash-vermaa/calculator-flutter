import 'package:flutter/material.dart';
import './app/CalculatorApp.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculator-app',
      home: CalculatorApp(),
    );
  }
}
