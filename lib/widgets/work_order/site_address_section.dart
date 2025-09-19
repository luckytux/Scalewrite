// File: lib/widgets/work_order/site_address_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:scalewrite_v2/providers/work_order_form_provider.dart';
import 'package:scalewrite_v2/utils/formatters.dart';
import 'package:scalewrite_v2/widgets/common/rounded_text_field.dart';
import 'package:scalewrite_v2/widgets/work_order/province_dropdown.dart';
import 'package:scalewrite_v2/widgets/map_picker_page.dart';
import 'package:scalewrite_v2/widgets/map_picker_page_desktop.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:latlong2/latlong.dart' as lm;
import 'package:geocoding/geocoding.dart';

class SiteAddressSection extends ConsumerWidget {
  final bool enabled;
  final Color? fillColor;

  const SiteAddressSection({
    super.key,
    required this.enabled,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(workOrderFormProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Site Address', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        RoundedTextField(
          controller: controller.siteAddressController,
          label: 'Street Address',
          readOnly: !enabled,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: RoundedTextField(
                controller: controller.siteCityController,
                label: 'City',
                readOnly: !enabled,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: ProvinceDropdown(
                controller: controller.siteProvinceController,
                enabled: enabled,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: RoundedTextField(
                controller: controller.sitePostalController,
                label: 'Postal Code',
                readOnly: !enabled,
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9 ]')),
                  PostalCodeFormatter(),
                ],
                validator: (value) => isValidCanadianPostalCode(value ?? '')
                    ? null
                    : 'Format: A1A 1A1',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedTextField(
              controller: controller.gpsLocationController,
              label: 'GPS Location (Optional)',
              readOnly: !enabled,
              suffixIcon: IconButton(
                icon: const Icon(Icons.location_on),
                onPressed: () {
                  final gps = controller.gpsLocationController.text.trim();
                  if (gps.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('GPS field is empty')),
                    );
                    return;
                  }
                  final formatted = formatGpsCoordinates(gps);
                  if (formatted == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid GPS coordinates')),
                    );
                    return;
                  }
                  final url = 'https://www.google.com/maps/search/?api=1&query=$formatted';
                  launchUrl(Uri.parse(url));
                },
              ),
            ),
            if (enabled) ...[
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Theme.of(context).platform == TargetPlatform.android
                            ? const MapPickerPage()
                            : const MapPickerPageDesktop(),
                      ),
                    );

                    // Accept either google_maps_flutter.LatLng or latlong2.LatLng
                    final coords = _coerceLatLng(result);
                    if (coords != null) {
                      final lat = coords.$1;
                      final lng = coords.$2;

                      controller.gpsLocationController.text =
                          '${lat.toStringAsFixed(6)},${lng.toStringAsFixed(6)}';

                      // Reverse-geocode safely (desktop/web can throw)
                      try {
                        final placemarks = await placemarkFromCoordinates(lat, lng);
                        if (placemarks.isNotEmpty) {
                          final place = placemarks.first;

                          Future<void> maybeOverwrite(
                            TextEditingController ctrl,
                            String label,
                            String? newVal,
                          ) async {
                            if (newVal == null || newVal.trim().isEmpty) return;
                            if (ctrl.text.trim().isEmpty) {
                              ctrl.text = newVal;
                            } else {
                              final confirm = await showDialog<bool>(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text('Overwrite $label?'),
                                  content: Text(
                                    'Detected "$newVal" for $label. Overwrite existing value "${ctrl.text}"?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, false),
                                      child: const Text('No'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, true),
                                      child: const Text('Yes'),
                                    ),
                                  ],
                                ),
                              );
                              if (confirm == true) ctrl.text = newVal;
                            }
                          }

                          await maybeOverwrite(
                            controller.siteAddressController,
                            'Street Address',
                            place.street,
                          );
                          await maybeOverwrite(
                            controller.siteCityController,
                            'City',
                            place.locality,
                          );
                          await maybeOverwrite(
                            controller.siteProvinceController,
                            'Province',
                            place.administrativeArea,
                          );
                          await maybeOverwrite(
                            controller.sitePostalController,
                            'Postal Code',
                            place.postalCode,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('GPS location used to detect address.')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('No address found for these coordinates.')),
                          );
                        }
                      } catch (_) {
                        // Platform not supported / permissions / network error.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Reverse geocoding not available; saved GPS only.'),
                          ),
                        );
                      }
                    } else if (result != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid location result returned')),
                      );
                    }
                  },
                  icon: const Icon(Icons.my_location),
                  label: const Text('Pin Location'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade100,
                    foregroundColor: Colors.teal.shade900,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }

  /// Coerce either google_maps_flutter.LatLng or latlong2.LatLng into (lat, lng).
  /// Returns null if the result is neither type.
  (double, double)? _coerceLatLng(dynamic result) {
    if (result is gm.LatLng) {
      return (result.latitude, result.longitude);
    }
    if (result is lm.LatLng) {
      return (result.latitude, result.longitude);
    }
    return null;
  }

  String? formatGpsCoordinates(String input) {
    final parts = input.split(',');
    if (parts.length != 2) return null;

    final lat = double.tryParse(parts[0].trim());
    final lng = double.tryParse(parts[1].trim());
    if (lat == null || lng == null) return null;
    if (lat.abs() > 90 || lng.abs() > 180) return null;

    return '${lat.toStringAsFixed(6)},${lng.toStringAsFixed(6)}';
  }
}
