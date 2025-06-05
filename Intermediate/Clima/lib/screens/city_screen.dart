import 'package:flutter/material.dart';
import 'package:Clima/components/constents.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.fromLTRB(10, 25, 0, 0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_outlined),
                iconSize: 50,
                color: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.location_city_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hint: Text(
                    'Enter name of city',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text('Check Weather', style: kCityCheckWeatherStyle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
