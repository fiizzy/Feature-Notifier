import 'package:get_storage/get_storage.dart';

class FeatureNotifierStorage {
  static GetStorage storage = GetStorage();

  static write({required bool value, required int id}) {
    final storage = GetStorage();
    storage.write("isViewed/$id", value);
  }

  static bool read(int id) {
    final storage = GetStorage();
    return storage.read("isViewed/$id") ?? false;
  }
}
