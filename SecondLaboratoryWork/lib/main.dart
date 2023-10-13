import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Лебедев Георгий Олегович'),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(16)),
              Container(
                  width: 150,
                  height: 50,
                  color: Colors.red,
                  child: Center(
                      child: Text('Лебедев',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                          textAlign: TextAlign.center))),
              Padding(padding: EdgeInsets.all(16)),
              Container(
                  width: 150,
                  height: 50,
                  color: Colors.indigo,
                  child: Center(
                      child: Text('Георгий',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                          textAlign: TextAlign.center))),
              Padding(padding: EdgeInsets.all(16)),
              Container(
                  width: 150,
                  height: 50,
                  color: Colors.blueGrey,
                  child: Center(
                      child: Text('Олегович',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                          textAlign: TextAlign.center))),
              Padding(padding: EdgeInsets.all(16)),
              Container(
                  width: 150,
                  height: 50,
                  color: Colors.teal,
                  child: Center(
                      child: Text('2002г.',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                          textAlign: TextAlign.center))),
              Padding(padding: EdgeInsets.all(16)),
              Container(
                  width: 150,
                  height: 50,
                  color: Colors.deepPurpleAccent,
                  child: Center(
                      child: Text('420-1',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                          textAlign: TextAlign.center)))
            ],
          ),
        ),
      ),
    );
  }
}
