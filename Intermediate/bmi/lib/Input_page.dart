import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'ReusableColumn.dart';
import 'RoundedIconButton.dart';
import 'package:bmi/Resut_page.dart';
import 'package:bmi/CustomizeButton.dart';
import 'package:bmi/Logic.dart';
const kMainColor = Color(0xFF26294D);
const kSecondryColor = Color(0xFF32366C);
const kTextColor = Color(0xFFB9BDD0);
const kTextStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: kTextColor);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputpageState();
}

class _InputpageState extends State<InputPage> {

  Gender selectedGender = Gender.male;
  int height = 180;
  int weight=30;
  int age=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI Calculator'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    selectedGender == Gender.male ? kSecondryColor : kMainColor,
                    EdgeInsets.fromLTRB(15, 15, 15, 10),
                    ReusableColumn(kTextColor, FontAwesomeIcons.mars, 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    selectedGender == Gender.female
                        ? kSecondryColor
                        : kMainColor,
                    EdgeInsets.fromLTRB(15, 15, 15, 10),
                    ReusableColumn(
                        kTextColor, FontAwesomeIcons.venus, 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  () {},
                  kMainColor,
                  EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          Text(
                            'CM',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: kTextColor,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0XFF8D8E98),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 13),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30)),
                        child: Slider(
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                          max: 250,
                          min: 110,
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    () {},
                    kMainColor,
                    EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              FontAwesomeIcons.minus,
                              (){
                                if(age>=0) {
                                  setState(() {
                                    age--;
                                  });
                                }
                            }
                            ),
                            RoundedIconButton(
                              FontAwesomeIcons.plus,
                                    (){

                                    setState(() {
                                      age++;
                                    });

                                }
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    () {},
                    Color(0xFF26294D),
                    EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 40,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                  FontAwesomeIcons.minus,
                                      (){
                                    if(weight>=0) {
                                      setState(() {
                                        weight--;
                                      });
                                    }
                                  }
                              ),
                              RoundedIconButton(
                                  FontAwesomeIcons.plus,
                                      (){

                                    setState(() {
                                      weight++;
                                    });

                                  }
                              ),
                            ],
                          ),

                        ],
                      ),
                  ),
                ),
              ],
            ),
          ),
          CustomizeButton(text:'CALCULATE',onTap: (){
            Logic logic=Logic(height: height,weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(bmiResult:logic.calculateBMI(), category: logic.bmiCategory(),interpretation: logic.interpretation(),),),);
          },),
        ],
      ),
    );
  }
}




