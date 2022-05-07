//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<CalculatorApp> {
  String op = "";
  String eqn = "";
  String res = "";
  String cont = "";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
  double midres1 = 0;
  double midres2 = 0;
  btnpressed(btntext) {
    setState(() {
      //print(btntext);
      if (btntext == "C") {
        eqn = "";
        res = "";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (btntext == "⌫") {
        if (res != null && res.length > 0) {
          res = res.substring(0, res.length - 1);
        } else {
          eqn = eqn.substring(0, eqn.length - 1);
          res = eqn;
          eqn = "";
          return;
        }
      } else if (btntext == "+" || btntext == "-" || btntext == "X" || btntext == "/") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        eqn = cont + btntext;
        res = "";
        midres1 = double.parse(cont);
        cont = "";
        op = btntext;
        //print(midres);
      } else if (btntext == "=") {
        eqn = eqn + cont;
        midres2 = double.parse(cont);
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        if (op == "+") {
          res = (midres1 + midres2).toString();
          cont = res;
          midres1 = 0;
          midres2 = 0;
        } else if (op == "-") {
          res = (midres1 - midres2).toString();
          cont = res;
          midres1 = 0;
          midres2 = 0;
        } else if (op == "X") {
          res = (midres1 * midres2).toString();
          cont = res;
          midres1 = 0;
          midres2 = 0;
        } else if (op == "/") {
          res = (midres1 / midres2).toStringAsFixed(9);
          cont = res;
          midres1 = 0;
          midres2 = 0;
        }
      } else {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        res = res + btntext;
        cont = res;
      }

      //for()
    });
  }

  Widget _button(String btntext, Color btncolor, double btnheight) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12 * btnheight,
      color: btncolor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(16),
        child: Text(
          btntext,
          style: TextStyle(fontSize: 35, color: Colors.white),
        ),
        onPressed: () => btnpressed(btntext),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff333333),
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .15,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(20),
            child: Text(
              eqn,
              style: TextStyle(fontSize: equationFontSize, color: Colors.white),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(20),
            child: Text(
              res,
              style: TextStyle(fontSize: resultFontSize, color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(children: [
                      _button("C", Colors.deepOrangeAccent, 1),
                      _button("⌫", Colors.orange, 1),
                      _button("+", Colors.pink, 1),
                    ]),
                    TableRow(children: [
                      _button("7", Colors.lightBlue, 1),
                      _button("8", Colors.lightBlue, 1),
                      _button("9", Colors.lightBlue, 1),
                    ]),
                    TableRow(children: [
                      _button("4", Colors.lightBlue, 1),
                      _button("5", Colors.lightBlue, 1),
                      _button("6", Colors.lightBlue, 1),
                    ]),
                    TableRow(children: [
                      _button("1", Colors.lightBlue, 1),
                      _button("2", Colors.lightBlue, 1),
                      _button("3", Colors.lightBlue, 1),
                    ]),
                    TableRow(children: [
                      _button(".", Colors.lightBlue, 1),
                      _button("0", Colors.lightBlue, 1),
                      _button("00", Colors.lightBlue, 1),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(children: [
                  TableRow(children: [
                    _button("X", Colors.pinkAccent, 1),
                  ]),
                  TableRow(children: [
                    _button("-", Colors.amberAccent, 1),
                  ]),
                  TableRow(children: [
                    _button("/", Colors.purple, 1),
                  ]),
                  TableRow(children: [
                    _button("=", Colors.deepOrange, 2),
                  ]),
                ]),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
