import 'package:flutter/material.dart';
import 'package:bmi/Input_page.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF090F32),
        appBarTheme: AppBarTheme(
          color: Color(0xFF121539),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),

      ),
      home: InputPage(),
    );
  }
}

