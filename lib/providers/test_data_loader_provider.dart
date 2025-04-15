// File: lib/providers/test_data_loader_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/test_data_loader.dart';

final testDataLoaderProvider = ChangeNotifierProvider<TestDataLoader>((ref) {
  return TestDataLoader(ref);
});
