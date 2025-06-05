import 'package:http/http.dart'as http;
import 'package:Clima/sevices/location.dart';
import 'package:Clima/components/constents.dart';
import 'dart:convert';
class Networking{

  var lat;
  var long;
  Future<dynamic> getResponse(Location locate)async{
    lat=locate.latitude;
    long=locate.longitude;
    // http.Request response=await http.Request('GET',Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22'));
    http.Response response= await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$kApiKey&units=metric'));
    String data = await response.body;

    return jsonDecode(data);
  }
}
