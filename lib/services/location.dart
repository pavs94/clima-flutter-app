import 'package:geolocator/geolocator.dart';

class LocationInfo {
  double lat;
  double long;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      long = position.longitude;
    } catch (e) {
      print("Location Not Found!");
    }
  }
}
