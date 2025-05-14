import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'map_picker_page_mobile.dart';
import 'map_picker_page_desktop.dart';

class MapPickerPage extends StatelessWidget {
  const MapPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) {
      return const MapPickerPageMobile();
    } else {
      return const MapPickerPageDesktop();
    }
  }
}
