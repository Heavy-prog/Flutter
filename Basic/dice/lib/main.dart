import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftVariable = 1;
  int rightVariable = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red.shade400,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Dice',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                  color: Colors.white),
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      random();
                    });
                  },
                  child: Image.asset('images/dice$leftVariable.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      random();
                    });
                    print('right pressed');
                  },
                  child: Image.asset('images/dice$rightVariable.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
  void random(){
    leftVariable=Random().nextInt(6)+1;
    rightVariable=Random().nextInt(6)+1;
  }
}
