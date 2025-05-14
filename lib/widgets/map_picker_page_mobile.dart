// File: lib/widgets/map_picker_page.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapPickerPageMobile extends StatefulWidget {
  const MapPickerPageMobile({super.key});

  @override
  State<MapPickerPageMobile> createState() => _MapPickerPageMobileState();
}

class _MapPickerPageMobileState extends State<MapPickerPageMobile> {
  LatLng? selectedLatLng;
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    await Geolocator.requestPermission();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<LatLng> _getCurrentLocation() async {
    final pos = await Geolocator.getCurrentPosition();
    return LatLng(pos.latitude, pos.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LatLng>(
      future: _getCurrentLocation(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

        final initialLatLng = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: const Text('Select Location')),
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: initialLatLng, zoom: 16),
            onTap: (latLng) {
              setState(() => selectedLatLng = latLng);
            },
            markers: selectedLatLng != null
                ? {
                    Marker(markerId: const MarkerId('selected'), position: selectedLatLng!)
                  }
                : {},
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: selectedLatLng != null
                ? () => Navigator.pop(context, selectedLatLng)
                : null,
            label: const Text('Confirm Location'),
            icon: const Icon(Icons.check),
          ),
        );
      },
    );
  }
}
