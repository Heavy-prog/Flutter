import 'package:geolocator/geolocator.dart';
class Location {
  double longitude = 0;
  double latitude = 0;

  // Location(this.latitude,this.longitude);

  Future<void> getLocation() async {
    try {
      LocationPermission ask = await Geolocator.requestPermission();
      if (ask == LocationPermission.deniedForever) {
        await Geolocator.openLocationSettings();
      }
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.low));
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}