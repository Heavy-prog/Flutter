import 'package:flutter/material.dart';
import 'quiz_logic.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main() {
  runApp(MaterialApp(home: Quizzler(),));
}

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Widget> scoreKeeper = [];
  QuizLogic  logic=QuizLogic();
  void scoreKeeperAdd(bool answer){
    if(logic.checkAnswer(answer)==true){
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      logic.nextQuestion();
    }
    else{
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      logic.nextQuestion();
    }
  }
  void answerCheck(bool answer){
    setState(() {
      if(logic.questionRemaining()==false) {

        Alert(
          context: context,
          type: AlertType.success,
          title: "Finished",
          desc: "Excellent You completed your quiz.",
          buttons: [
            DialogButton(
              child: Text(
                "Retake",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0)
              ]),
            )
          ],
        ).show();
          logic.reset();

          //TODO Step 4 Part D - empty out the scoreKeeper.
          scoreKeeper = [];
      }
      else {
            scoreKeeperAdd(answer);
            }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey.shade600,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Center(
            child: Text('Quizzler'),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      logic.getQuestionText(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Container(
                  // margin: EdgeInsets.fromLTRB(20.0, 25.0, 20.0,5.0),
                  padding: EdgeInsets.fromLTRB(30.0, 65.0, 30, 5.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      answerCheck(true);
                    },
                    child: Text(
                      'True',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  // margin: EdgeInsets.fromLTRB(0,20.0,0,0),
                  padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 65.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      answerCheck(false);
                    },
                    child: Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(children: scoreKeeper)
            ],
          ),

      ),
    );
  }

}
