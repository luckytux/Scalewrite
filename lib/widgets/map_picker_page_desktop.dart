// File: lib/widgets/map_picker_page_desktop.dart

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPickerPageDesktop extends StatefulWidget {
  const MapPickerPageDesktop({super.key});

  @override
  State<MapPickerPageDesktop> createState() => _MapPickerPageDesktopState();
}

class _MapPickerPageDesktopState extends State<MapPickerPageDesktop> {
  LatLng? selectedLatLng;
  final mapController = MapController();

  final LatLng defaultCenter = LatLng(51.0447, -114.0719); // Calgary or fallback center

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Location')),
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: defaultCenter,
          zoom: 14.0,
          onTap: (tapPosition, latLng) {
            setState(() {
              selectedLatLng = latLng;
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          if (selectedLatLng != null)
            MarkerLayer(
              markers: [
                Marker(
                  width: 40,
                  height: 40,
                  point: selectedLatLng!,
                  child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
                ),
              ],
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final result = selectedLatLng;
          if (result != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pop<LatLng?>(context, result);
            });
          }
        },
        label: const Text('Confirm Location'),
        icon: const Icon(Icons.check),
      ),
    );
  }
}
