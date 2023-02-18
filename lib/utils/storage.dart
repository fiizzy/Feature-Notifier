import 'package:get_storage/get_storage.dart';

class FeatureNotifierStorage {
  static bool? isViewed;

  static write(bool? value) {
    final storage = GetStorage();
    storage.write("isViewed", true);
    isViewed = storage.read("isViewed");
  }

  static read(String key) {
    final storage = GetStorage();
    isViewed = storage.read("isViewed");
  }
}
