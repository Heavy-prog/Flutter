import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(xylophone());
}

class xylophone extends StatefulWidget {
  const xylophone({super.key});

  @override
  State<xylophone> createState() => _xylophoneState();
}

class _xylophoneState extends State<xylophone> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade400,
          title: Center(
            child: Text('Xylophone'),
          ),
        ),
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // crossAxisAlignment: CrossAxisAlignment.start,
                Expanded(child: customiseButton(1, Colors.red)),
                Expanded(child: customiseButton(2, Colors.teal)),
                Expanded(child: customiseButton(3, Colors.purple)),
                Expanded(child: customiseButton(4, Colors.green)),
                Expanded(child: customiseButton(5, Colors.amber)),
                Expanded(child: customiseButton(6, Colors.cyan)),
                Expanded(child: customiseButton(7, Colors.grey)),
              ]),
        ),
      ),
    );
  }

  Widget customiseButton(int x, Color color) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
        )
      ),
      onPressed: () {

          Alert(
            context: context,
            title: "RFLUTTER ALERT",
            desc: "Flutter is more awesome with RFlutter Alert.",

          ).show();

        final player = AudioPlayer();
        player.play(
          AssetSource('note$x.wav'),
        );
      },
      child: Text(''),
    );
  }
}
