import 'package:flutter/material.dart';

class ReusableColumn extends StatelessWidget {
  final Color colour;
  final IconData icon;
  final String gender;

  ReusableColumn(@required this.colour,this.icon,this.gender);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 100.0,
          color: colour,
        ),
        SizedBox(height: 5.0,),
        Text(
          gender,
          style:
          TextStyle(color: colour, fontSize: 20),
        )
      ],
    );
  }
}
