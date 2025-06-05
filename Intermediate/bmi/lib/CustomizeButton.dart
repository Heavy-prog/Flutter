import 'package:flutter/material.dart';
class CustomizeButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  CustomizeButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(15.0),
        width: double.infinity,
        height: 80.0,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 30.0),
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xFFFF0067),
        ),
      ),
    );
  }
}