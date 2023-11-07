import 'package:flutter/material.dart';
import "dart:core";
import './PlusKeyButton.dart';
import './KeypadButton.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => CalculatorAppState();
}

class CalculatorAppState extends State<CalculatorApp> {
  String displayExpr = '', displayRes = '', expr = '', op = '';
  double mem1 = 0, mem2 = 0, res = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(
              color: Colors.black, fontFamily: 'roboto', fontSize: 24),
        ),
        backgroundColor: Colors.white,
      ),
      body: Flex(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            width: 360,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,

              children: <Widget>[

                Text(
                  displayExpr,
                  style: const TextStyle(
                    fontFamily: 'roboto',
                    fontSize: 36,
                  ),
                  textAlign: TextAlign.right,
                ),
                Text(
                  displayRes,
                  style: const TextStyle(
                    fontFamily: 'roboto',
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  KeypadButton(
                      btnText: "+/-",
                      bgColor: Colors.grey.shade800,
                      update: calculate),
                  KeypadButton(
                      btnText: "%",
                      bgColor: Colors.grey.shade800,
                      update: calculate),
                  KeypadButton(
                      btnText: "C",
                      bgColor: Colors.grey.shade800,
                      update: calculate),
                  KeypadButton(
                      btnText: "/",
                      bgColor: Colors.grey.shade800,
                      update: calculate),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  KeypadButton(
                      btnText: "7",
                      bgColor: Colors.grey.shade700,
                      update: calculate),
                  KeypadButton(
                      btnText: "8",
                      bgColor: Colors.grey.shade700,
                      update: calculate),
                  KeypadButton(
                      btnText: "9",
                      bgColor: Colors.grey.shade700,
                      update: calculate),
                  KeypadButton(
                      btnText: "*",
                      bgColor: Colors.grey.shade800,
                      update: calculate),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  KeypadButton(
                      btnText: "4",
                      bgColor: Colors.grey.shade700,
                      update: calculate),
                  KeypadButton(
                      btnText: "5",
                      bgColor: Colors.grey.shade700,
                      update: calculate),
                  KeypadButton(
                      btnText: "6",
                      bgColor: Colors.grey.shade700,
                      update: calculate),
                  KeypadButton(
                      btnText: "-",
                      bgColor: Colors.grey.shade800,
                      update: calculate),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      KeypadButton(
                          btnText: "1",
                          bgColor: Colors.grey.shade700,
                          update: calculate),
                      KeypadButton(
                          btnText: "0",
                          bgColor: Colors.grey.shade800,
                          update: calculate),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      KeypadButton(
                          btnText: "2",
                          bgColor: Colors.grey.shade700,
                          update: calculate),
                      KeypadButton(
                          btnText: ".",
                          bgColor: Colors.grey.shade800,
                          update: calculate),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      KeypadButton(
                          btnText: "3",
                          bgColor: Colors.grey.shade700,
                          update: calculate),
                      KeypadButton(
                          btnText: "=",
                          bgColor: Colors.grey.shade800,
                          update: calculate),
                    ],
                  ),
                  PlusKeypadButton(update: calculate),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }


  @override
  initState() {
    displayRes = '';
    displayExpr = '';
    expr = '';
    op = '';
    mem1 = 0;
    mem2 = 0;
    res = 0;
  }

  double solve() {
    if (op == '+') {
      return mem1 + mem2;
    } else if (op == '-') {
      return mem1 - mem2;
    } else if (op == '*') {
      return mem1 * mem2;
    } else if (op == '/') {
      return mem1 / mem2;
    }
    return mem1;
  }

  calculate(btnText) {
    if (btnText == 'C') {
      initState();
    }

    int num = btnText.codeUnitAt(0) - '0'.codeUnitAt(0);
    if (-1 < num && num < 10) {
      expr += btnText;
      if (op != "") {
        mem2 = mem2 * 10 + num;
        res = solve();
      } else {
        mem1 = mem1 * 10 + num;
      }
    }

    if (btnText == '+') {
      expr += btnText;
      if (mem2 != 0) {
        res = solve();
      }
      op = btnText;
    }

    if (btnText == '-') {
      expr += btnText;
      if (mem2 != 0) {
        res = solve();
      }
      op = btnText;
    }

    if (btnText == '*') {
      expr += btnText;
      if (mem2 != 0) {
        res = solve();
      }
      op = btnText;
    }

    if (btnText == '/') {
      expr += btnText;
      if (mem2 != 0) {
        res = solve();
      }
      op = btnText;
    }

    setState(() {
      if (btnText == "="){
        List<String> tmp = displayRes.split('.');
        if (tmp[1] == '0'){
          displayExpr = tmp[0];
        }
        else{
          displayExpr = displayRes;
        }

        displayRes = "";
        mem1 = res;
        mem2 = 0;
        expr = "${mem1}";
        op = "";
      }
      else {
        displayExpr = expr;
        displayRes = res.toString();
      }
    });
  }
}
