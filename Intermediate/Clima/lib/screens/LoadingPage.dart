import 'package:flutter/material.dart';
import 'package:Clima/sevices/weatherModel.dart';
import 'location_scree.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingPage extends StatefulWidget {
  LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  void getLocationWeather() async {
    final weatherData = await WeatherModel().getLocationWeather();

    // print('king khan:${weatherData["main"]["temp"]}');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocationWeather();

  }

  @override
  Widget build(BuildContext context) {
    // getResponse();
    return Container(
        child: Center(
          child: SpinKitWanderingCubes(
            size: 100,
            color: Colors.white,
          ),
        ),);
  }

}
