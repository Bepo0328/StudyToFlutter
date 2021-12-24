import 'package:geolocator/geolocator.dart';

class MyLocation {
  double? latitude;
  double? longitude;

  Future<void> getMyCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }

    try {
      Position position = await Geolocator.
      getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch(e) {
      print('There was a problem with the internet connection.');
    }
  }
}