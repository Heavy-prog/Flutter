import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final EdgeInsets marg;
  final Function() onPres;
  ReusableCard(this.onPres,@required this.colour, this.marg, this.cardChild);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPres,
      child: Container(
        child: cardChild,
        decoration:
        BoxDecoration(color: colour, borderRadius: BorderRadius.circular(10)),
        margin: marg,
      ),
    );
  }
}