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
  int ballNumber=1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade400,
        appBar: AppBar(
          title: Center(
            child: Text('Ask me Anything'),
          ),
          backgroundColor: Colors.blue.shade600,
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                      onPressed: (){
                        setState(() {
                          ballNumber=Random().nextInt(5)+1;
                        });
                      } ,
                      child: Image.asset('images/ball$ballNumber.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
