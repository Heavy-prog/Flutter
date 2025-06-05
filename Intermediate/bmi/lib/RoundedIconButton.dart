import 'package:flutter/material.dart';
class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  Function() onPress;

  RoundedIconButton(@required this.icon,this.onPress);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon,color: Colors.white70,),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      focusColor: Color(0xFF212747),
      constraints: BoxConstraints(minWidth: 56, minHeight: 37),
    );
  }}