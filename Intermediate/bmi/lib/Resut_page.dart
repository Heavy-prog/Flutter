import 'package:bmi/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'package:bmi/CustomizeButton.dart';
import 'package:bmi/Input_page.dart';

class ResultPage extends StatelessWidget {
  final bmiResult;
  final category;
  final interpretation;
  ResultPage({required this.bmiResult,required this.category,required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.topLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              () {},
              Color(0xFF26294D),
              EdgeInsets.all(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    interpretation,
                    style: TextStyle(color: Colors.white, fontSize: 15,),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: CustomizeButton(text:'RE-CALCULATE',onTap: (){
            Navigator.pop(context);

          },),)
        ],
      ),
    );
  }
}
