import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;


  Future<void> getCurrentLocation() async {
    Geolocator.checkPermission().then((status) {
      if (status == LocationPermission.denied) {
        Geolocator.requestPermission().then((status) {
          if (status == LocationPermission.denied) {
            // Handle the case when the user denies location permissions.
          } else if (status == LocationPermission.deniedForever) {
            // Handle the case when the user denies location permissions permanently.
          } else {
            // Location permissions granted, proceed with obtaining the location.
            getCurrentLocation();
          }
        });
      }
    });
    try {
      Position? position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

}
