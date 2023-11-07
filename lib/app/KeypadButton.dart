import 'package:flutter/material.dart';

class KeypadButton extends StatelessWidget {
  String btnText;
  Color bgColor;
  Function update;

  KeypadButton(
      {super.key,
        required this.btnText,
        required this.bgColor,
        required this.update});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          update(btnText);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(90, 75),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: bgColor,
        ),
        child: Text(
          btnText,
          style: const TextStyle(fontSize: 36, fontFamily: 'roboto'),
        ),
      ),
    );
  }
}
