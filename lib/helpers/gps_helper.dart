// File: lib/helpers/gps_helper.dart

import 'package:geolocator/geolocator.dart';

class GpsHelper {
  static Future<Position?> getCurrentLocation() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return null;

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return null;
      }
      if (permission == LocationPermission.deniedForever) return null;

      // New API: use locationSettings instead of desiredAccuracy
      final settings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 8), // optional: avoid hanging too long
      );

      // Try current position first
      return await Geolocator.getCurrentPosition(locationSettings: settings)
          .timeout(const Duration(seconds: 10));
    } catch (_) {
      // Fallback to last known (may be null or stale)
      try {
        return await Geolocator.getLastKnownPosition();
      } catch (_) {
        return null;
      }
    }
  }
}
