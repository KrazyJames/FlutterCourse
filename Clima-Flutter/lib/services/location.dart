import 'package:geolocator/geolocator.dart';

class Location {
  Location({this.lat, this.long});
  double lat;
  double long;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      this.lat = position.latitude;
      this.long = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
