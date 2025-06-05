import 'package:Clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:Clima/components/constents.dart';
import 'package:Clima/sevices/weatherModel.dart';
class LocationScreen extends StatefulWidget {
  LocationScreen(this.locationWeather);
  final locationWeather;


  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature=2;
  WeatherModel weather=WeatherModel();
  String weatherIcon="";
  String message='';
  String cityName='';

  void updateUI(dynamic  weatherDa){

      double temp=weatherDa["main"]["temp"];
      int id=weatherDa["weather"][0]["id"];

      weatherIcon=weather.getWeatherIcon(id);
      temperature=temp.toInt();
      message=weather.getMessage(temperature);
      cityName=weatherDa["name"];

  }
  @override
  void initState(){
    super.initState();
    updateUI(widget.locationWeather);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/clima_background.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: ()async{
                      final weatherData= await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      color: Colors.teal.shade100,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      },),);
                    },
                    child: Icon(
                      Icons.location_city,
                      color: Colors.teal.shade100,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temperature}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${message} in $cityName!",
                  textAlign: TextAlign.left,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}