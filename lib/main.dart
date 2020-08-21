import 'package:flutter/material.dart';
import 'package:calculator/calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calc',
      theme: ThemeData(
          primarySwatch: Colors.blue, backgroundColor: Colors.black26),
      home: CalculatorHome(title: 'Flutter Calculator'),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  CalculatorHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _str = "0";
  var _calculation = Calculation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Card(
              color: Colors.lightGreen[50],
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  _str,
                  textScaleFactor: 2.0,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 3,
                      child: FlatButton(
                        onPressed: () {deleteAll();},
                        child: Text("C", style: TextStyle(color: Colors.white)),
                        color: Colors.black54,
                      )),
                  Expanded(
                      flex: 1,
                      child: FlatButton(
                        onPressed: () {deleteOne();},
                        child:
                            Text("<-", style: TextStyle(color: Colors.white)),
                        color: Colors.black87,
                      )),
                ],
              )),
          Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
//                crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ExpandedRow(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ExpandedButton(
                                child: Text("7",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  add("7");
                                },
                                color: Colors.blueAccent),
                            ExpandedButton(
                                child: Text("8",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  add("8");
                                },
                                color: Colors.blueAccent),
                            ExpandedButton(
                                child: Text("9",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  add("9");
                                },
                                color: Colors.blueAccent)
                          ],
                        ),
                        ExpandedRow(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ExpandedButton(
                                child: Text("4",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  add("4");
                                },
                                color: Colors.blueAccent),
                            ExpandedButton(
                                child: Text("5",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  add("5");
                                },
                                color: Colors.blueAccent),
                            ExpandedButton(
                                child: Text("6",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  add("6");
                                },
                                color: Colors.blueAccent)
                          ],
                        ),
                        ExpandedRow(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ExpandedButton(
                                child: Text("1",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  add("1");
                                },
                                color: Colors.blueAccent),
                            ExpandedButton(
                                child: Text("2",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  add("2");
                                },
                                color: Colors.blueAccent),
                            ExpandedButton(
                                child: Text("3",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  add("3");
                                },
                                color: Colors.blueAccent)
                          ],
                        ),
                        ExpandedRow(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ExpandedButton(
                                child: Text("0",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  add("0");
                                },
                                color: Colors.blueAccent),
                            ExpandedButton(
                                child: Text(".",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  add(".");
                                },
                                color: Colors.blueAccent),
                            ExpandedButton(
                                child: Text("="),
                                onPressed: () {
                                  getResult();
                                },
                                color: Colors.blue[50])
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ExpandedButton(
                            child: Text("%"),
                            onPressed: () {
                              add("%");
                            },
                            color: Colors.blue[50]
                        ),
                        ExpandedButton(
                            child: Text("x"),
                            onPressed: () {
                              add("x");
                            },
                            color: Colors.blue[50]
                        ),
                        ExpandedButton(
                            child: Text("-"),
                            onPressed: () {
                              add("-");
                            },
                            color: Colors.blue[50]
                        ),
                        ExpandedButton(
                            child: Text("+"),
                            onPressed: () {
                              add("+");
                            },
                            color: Colors.blue[50]
                        )
                      ],
                    ),
                  )
                ],
              ))
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void add(String a) {
    setState(() {
      _calculation.add(a);
      _str = _calculation.getString();
    });
  }

  void deleteAll() {
    setState(() {
      _calculation.deleteAll();
      _str = _calculation.getString();
    });
    _calculation = new Calculation();
  }

  void deleteOne() {
    setState(() {
      _calculation.deleteOne();
      _str = _calculation.getString();
    });
  }

  void getResult() {
    setState(() {
      try {
        _str = _calculation.getResult().toString();
      } on DivideByZeroException {
        _str = "Division by 0 is illegal";
        _calculation = new Calculation();
      }
    });

  }
}


class ExpandedButton extends StatelessWidget {
  ExpandedButton({this.onPressed, this.child, this.color});

  final Widget child;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: FlatButton(
          onPressed: onPressed,
          child: child,
          color: color,
        ));
  }
}

class ExpandedRow extends StatelessWidget {
  ExpandedRow({this.children, this.crossAxisAlignment});

  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Row(
          children: children,
          crossAxisAlignment: crossAxisAlignment,
        ));
  }
}
