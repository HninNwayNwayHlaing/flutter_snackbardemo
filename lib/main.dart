import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _text = '';
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();

  void _onChange(String value) {
    setState(() {
      _text = value;
    });
  }

  void showSnackBar(String value) {
    if (value.isEmpty) return;
    _scaffoldState.currentState.showSnackBar(
      new SnackBar(content: new Text(value)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldState,
      appBar: new AppBar(
        title: new Text('Snack Bar Demo'),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(onChanged: (String value){_onChange(value);},),
              new RaisedButton(
                  child: new Text('Snack Bar!'),
                  onPressed: () {
                    showSnackBar(_text);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
