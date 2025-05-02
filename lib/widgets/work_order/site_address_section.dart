// File: lib/widgets/work_order/site_address_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:scalewrite_v2/providers/work_order_form_provider.dart';
import 'package:scalewrite_v2/widgets/common/rounded_text_field.dart';
import 'package:scalewrite_v2/widgets/work_order/province_dropdown.dart';

class SiteAddressSection extends ConsumerWidget {
  final bool enabled;

  const SiteAddressSection({super.key, required this.enabled});

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
                  onPressed: () {
                    controller.gpsLocationController.text = '51.0486,-114.0708';
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Dummy GPS location filled')),
                    );
                  },
                  icon: const Icon(Icons.my_location),
                  label: const Text('Use Current Location'),
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
