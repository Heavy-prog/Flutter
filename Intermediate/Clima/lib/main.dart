import 'package:flutter/material.dart';
import 'components/constents.dart';
import 'screens/LoadingPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0x9074ADDD),
          appBarTheme: AppBarTheme(
              color: Color(0xFF74ADDD),
              titleTextStyle: kAppBarTextStyle
          ),

        ),
        home: Scaffold(appBar: AppBar(title: Center(child: Text('Clima'),),),
          body: LoadingPage(),
        )
    );
  }
}
