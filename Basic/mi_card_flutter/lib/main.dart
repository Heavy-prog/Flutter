import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.teal.shade700,
          // appBar: AppBar(
          //   backgroundColor: Colors.blue,
          //   title: Center(
          //     child: Text('My visiting card'),
          //   ),
          // ),
          body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      backgroundImage: AssetImage('images/diamond.png'),
                    ),
                    Text('Sufian Siddique',
                        style:TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily:'Great Vibes'
                        )
                    ),
                    Text('Flutter Developer',
                        style:TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily:'Pacifico'
                        )
                    ),
                    SizedBox(
                      child: Divider(
                        height: 10,
                        indent: 60,
                        endIndent: 60,
                        color: Colors.teal.shade400,
                        thickness: 2,
                    ),
                    ),
                    Card(
                      color:Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          size: 20,
                          color: Colors.teal[100],
                        ),
                        title: Text(' +92317902880',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      color:Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 25.0),
                      child:ListTile(
                        leading: Icon(
                          Icons.email,
                          size: 20,
                          color: Colors.teal[100],
                        ),
                        title: Text(' sufiansiddique50@gmail.com',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                      ),
                    ),
                    )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
