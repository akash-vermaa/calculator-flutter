import 'package:flutter/material.dart';
import './app/CalculatorApp.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'calculator-app',
      home: CalculatorApp(),
    );
  }
}
