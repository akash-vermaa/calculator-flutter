import 'package:calculator/app/KeypadButton.dart';
import 'package:flutter/material.dart';
import './KeypadButton.dart';

class PlusKeypadButton extends KeypadButton {
  Function update;

  PlusKeypadButton(
      {super.key,
        required this.update,
        super.btnText = '+',
        super.bgColor = Colors.grey})
      : super(update: update) {
    super.bgColor = Colors.grey.shade800;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          update(btnText);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(90, 150),
          backgroundColor: bgColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(
          btnText,
          style: const TextStyle(
              fontSize: 48, fontFamily: 'roboto', fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
