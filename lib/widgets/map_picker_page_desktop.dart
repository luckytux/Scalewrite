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

  // Calgary fallback center
  final LatLng defaultCenter = const LatLng(51.0447, -114.0719);

  // Prefer a human-readable UA per OSM policy
  static const _ua = 'ScaleWrite/1.0 (+mailto:you@yourdomain.com)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Location')),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              // flutter_map v6+: initialCenter / initialZoom
              initialCenter: defaultCenter,
              initialZoom: 14.0,
              onTap: (tapPosition, latLng) {
                setState(() => selectedLatLng = latLng);
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                // This is respected by flutter_map to set a UA; keep it meaningful
                userAgentPackageName: _ua,
                maxZoom: 19,
                // If your flutter_map version supports headers on NetworkTileProvider,
                // you can uncomment the below:
                // tileProvider: NetworkTileProvider(
                //   headers: const {'User-Agent': _ua, 'Referer': 'https://scalewrite.ca'},
                // ),
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

          // Simple OSM attribution overlay
          Positioned(
            right: 8,
            bottom: 8,
            child: DecoratedBox(
              decoration: BoxDecoration(
                // CHANGED: withOpacity -> withValues(alpha: ...)
                color: Colors.white.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  '© OpenStreetMap contributors',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: selectedLatLng == null
            ? null
            : () {
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
